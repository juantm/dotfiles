## Context

The fish shell config at `~/.config/fish/cachyos-config.fish` has a solid base (eza aliases, bat man pager, done notifications, bang-bang history functions) but is missing several integrations that exist in `~/.zshrc`:

- `fzf` (fuzzy finder — keybindings and tab completion)
- `zoxide` (smart `cd` with frecency ranking)
- `pyenv` + `pyenv-virtualenv` (Python version management)
- Cloud/k8s tooling: `kubectl`, `kubectx`, `gcloud`
- iTerm2 shell integration
- `./node_modules/.bin` in `$PATH`
- `brew update` missing from the `update` alias

All referenced tools are already installed (they are active in `.zshrc`). This is purely a fish-side gap.

## Goals / Non-Goals

**Goals:**
- Bring fish to parity with zsh for all interactive-session features
- Use fish-native integration commands where available (e.g., `fzf --fish`, `zoxide init fish`)
- Keep all additions in `cachyos-config.fish` to preserve the single-file convention

**Non-Goals:**
- Replicating zsh plugin management (zinit / lazy loading optimizations)
- Lazy-loading / deferred initialization (fish startup is already fast)
- Porting Arch/CachyOS-specific aliases that don't apply on macOS

## Decisions

### Use native fish init commands over manual porting

Each tool (`fzf`, `zoxide`, `pyenv`) ships a `--fish` or `fish` subcommand that emits correct fish syntax. Using these is safer than manually translating zsh init scripts.

- **fzf**: `fzf --fish | source` (requires fzf ≥ 0.48)
- **zoxide**: `zoxide init fish | source`
- **pyenv**: `pyenv init - fish | source` + `pyenv virtualenv-init - fish | source`
- **Alternatives considered**: Manually writing the bindings/functions — rejected; tool-generated init handles edge cases and updates automatically.

### `zoxide` replaces `cd` (not aliased as `z`)

The zsh config uses `zoxide init --cmd cd zsh`, so `cd` is already the zoxide-powered command there. Fish should match: `zoxide init --cmd cd fish | source`.

### All additions wrapped in `command -q <tool>` guards

Each integration block is gated on the tool being present. This prevents errors on machines where a tool isn't installed.

### `./node_modules/.bin` added as session PATH (not universal)

`fish_add_path` makes paths universal/permanent. A relative `./node_modules/.bin` entry in a universal variable would apply in every directory. Instead, prepend it in `cachyos-config.fish` with `set -x PATH ./node_modules/.bin $PATH` so it's set per session, relative to wherever fish starts.

### iTerm2 uses fish-specific integration file

The zsh config sources `~/.iterm2_shell_integration.zsh`. The fish equivalent is `~/.iterm2_shell_integration.fish` (downloaded via iTerm2's "Install Shell Integration" menu). Source it conditionally on `$TERM_PROGRAM == iTerm.app` and file existence.

## Risks / Trade-offs

- **pyenv-virtualenv fish support** → Mitigation: guard with `command -q pyenv-virtualenv-init`; skip gracefully if not available.
- **gcloud SDK path varies by install method** → Mitigation: check common locations (`$(brew --prefix)/share/google-cloud-sdk`) and use `test -f` before sourcing.
- **`./node_modules/.bin` relative PATH is a security concern** → Trade-off accepted; matches existing zsh behavior. Developers are aware.
- **`fzf --fish` requires fzf ≥ 0.48** → Mitigation: guard with `fzf --fish &>/dev/null` version check; fall back to key-binding only mode if unavailable.

## Migration Plan

All changes are purely additive. No existing config lines are removed or reordered. The `update` alias line is updated in place.

Rollback: remove or comment out the added blocks in `cachyos-config.fish`.
