## Why

The zsh configuration files (`.zshrc`, `.zshenv`, `.zprofile`, and `~/.zsh/completions/`) are not version-controlled in the dotfiles repo, making them invisible to stow and untracked by git. Additionally, the current config has a fragile background-sleep pattern for loading shell integrations and re-evals expensive tool inits (fzf, zoxide) on every shell start — caching them would shave measurable time off startup.

## What Changes

- Add `.zshrc`, `.zshenv`, `.zprofile`, and `.zsh/completions/` to the `zsh/` stow package
- Add `.stow-local-ignore` to prevent stowing `openspec/` and `.github/` subdirectories
- Replace the `(sleep 2 && _load_shell_integrations) &` pattern with zinit's `wait` mechanism for deferred loading of fzf, zoxide, and OMZ snippets
- Cache `fzf --zsh` and `zoxide init --cmd cd zsh` eval output to files; source the cache instead of re-evaling every shell start
- Consolidate PATH in `.zshenv` to a single export instead of sequential appends
- Clean up `fpath` injection from the OPENSPEC block into the top of `.zshrc` directly

## Capabilities

### New Capabilities

- `zsh-stow-layout`: The `zsh/` package has a valid stow structure with a `.stow-local-ignore` that excludes `openspec/` and `.github/`, and includes `.zshrc`, `.zshenv`, `.zprofile`, and `.zsh/completions/`
- `zsh-fast-startup`: Shell startup is optimized by caching slow eval outputs (fzf, zoxide) and using zinit deferred loading instead of background subshells

### Modified Capabilities

(none)

## Impact

- `~/.zshrc`, `~/.zshenv`, `~/.zprofile`, `~/.zsh/completions/` become symlinks after `stow zsh`
- `~/openspec/` and `~/.github/` are NOT created (excluded via `.stow-local-ignore`)
- Shell startup time reduced; fzf/zoxide integrations become reliable (no race with sleep)
- Existing `~/.zshrc.backup` and `~/.zshrc.ultra` remain untouched (not stow-managed)
