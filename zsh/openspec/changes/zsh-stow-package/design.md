## Context

The `zsh/` directory in the dotfiles repo holds the OpenSpec workflow (`openspec/`) and Copilot skills (`.github/`) but contains no actual zsh config files. The live config lives at `~/.zshrc`, `~/.zshenv`, `~/.zprofile`, and `~/.zsh/completions/` — completely unmanaged by stow.

Current startup benchmark: ~872ms. The main culprits are:
1. `fzf --zsh` and `zoxide init --cmd cd zsh` — each forks a subprocess and evals output on every shell start
2. `(sleep 2 && _load_shell_integrations) &` — a background subshell with a hard-coded sleep; unreliable and wastes a fork

## Goals / Non-Goals

**Goals:**
- All zsh config files tracked in dotfiles and symlink-manageable via `stow zsh`
- `openspec/` and `.github/` subdirectories excluded from stow via `.stow-local-ignore`
- Shell startup faster by caching eval-heavy tool inits (fzf, zoxide)
- Shell integrations loaded reliably via zinit `wait` instead of `sleep` subshells

**Non-Goals:**
- Switching plugin manager (zinit stays)
- Changing plugin set
- Managing `~/.zsh_history` or session files in the repo

## Decisions

**`.stow-local-ignore` to protect `openspec/` and `.github/`**

The `zsh/` directory is dual-purpose: a stow package root AND a working directory for OpenSpec. Without `.stow-local-ignore`, running `stow zsh` would create `~/openspec/` and `~/.github/` as symlinks, which is wrong. A `.stow-local-ignore` file with entries for `^openspec$` and `^\.github$` solves this cleanly.

*Alternative considered:* Moving openspec into a separate non-package directory (e.g., `.tools/openspec/`). Rejected — would break the existing workflow and all history.

**Cache `fzf` and `zoxide` eval output to `~/.cache/zsh/`**

Both `fzf --zsh` and `zoxide init --cmd cd zsh` produce static shell code that rarely changes. Caching their output to `~/.cache/zsh/fzf-init.zsh` and `~/.cache/zsh/zoxide-init.zsh` and sourcing those files instead cuts two subprocess forks per shell start.

Cache is regenerated when the tool's binary changes (compare `mtime` of binary vs cache file).

*Alternative considered:* Zinit `wait` to defer these. Rejected for fzf — `fzf`'s keybindings (Ctrl-R, Ctrl-T) need to be registered before the first prompt.

**Replace `sleep 2` background job with zinit `wait` for OMZ snippets**

The current pattern `(sleep 2 && _load_shell_integrations) &` spawns a subshell, sleeps 2 seconds, then loads zinit snippets inside the subshell — meaning the snippets are loaded in the background process, not the interactive shell. This means `OMZP::brew`, `gcloud`, `pyenv`, `kubectl`, etc. never actually take effect in the current shell. Using `zinit ice wait"2" lucid` loads them in the actual interactive shell after the prompt appears.

*Alternative considered:* `zsh-defer` plugin. Rejected — zinit already provides this natively.

**Consolidate PATH into a single export in `.zshenv`**

The current `.zshenv` uses multiple `export PATH="...:$PATH"` statements. A single consolidated `export PATH="a:b:c:...:$PATH"` is marginally faster (one fork-less export) and more readable.

## Risks / Trade-offs

- **Cache staleness** → If fzf/zoxide binary is updated but mtime check fails, old keybindings load. Mitigation: cache file names include the binary's mtime or a version string; `zsh -c 'source ~/.zshrc'` regenerates on mtime mismatch.
- **Stowing over existing files** → `~/.zshrc` etc. already exist as regular files. `stow` will refuse (conflict). Mitigation: backup and remove originals before first stow.
- **OMZ snippets now load in interactive shell** → Previously the background job loaded them in a subshell where they had no effect. Changing to zinit `wait` means they now actually take effect, which is correct but may surface previously-hidden issues (e.g., gcloud alias conflicts). Low risk.

## Migration Plan

1. Copy live config files into `zsh/` package structure
2. Apply speed optimizations to the copied files
3. Create `.stow-local-ignore`
4. Back up and remove live originals (`mv ~/.zshrc ~/.zshrc.pre-stow` etc.)
5. Run `stow zsh` from repo root
6. Benchmark startup: `time zsh -i -c exit`
