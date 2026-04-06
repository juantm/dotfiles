## Why

The fish config is missing several integrations and PATH additions that exist in `.zshrc`, leaving a gap in functionality when using fish as the primary shell. Closing this gap ensures a consistent, full-featured shell experience without falling back to zsh.

## What Changes

- Add `fzf` keybindings and fuzzy-completion integration
- Add `zoxide` integration (smart `cd` replacement, replacing the plain `cd` command)
- Add `pyenv` initialization for Python version management
- Add `kubectl` and `kubectx` completions/helper aliases
- Add `gcloud` SDK path and completions sourcing
- Add iTerm2 shell integration (macOS only, conditional on `$TERM_PROGRAM`)
- Add `./node_modules/.bin` to `$PATH`
- Fix `update` alias to include `brew update` (currently only runs `brew upgrade && brew cleanup`)

## Capabilities

### New Capabilities

- `fzf-integration`: fzf keybindings (Ctrl-R history, Ctrl-T file picker) and tab-completion via fzf
- `zoxide-integration`: initialize zoxide with `cd` as the command, providing smart directory jumping
- `pyenv-integration`: initialize pyenv and pyenv-virtualenv in fish
- `cloud-tools-integration`: completions and helpers for kubectl, kubectx, and gcloud SDK
- `iterm2-integration`: source iTerm2 shell integration script when running inside iTerm2 on macOS

### Modified Capabilities

- `path-additions`: extend PATH with `./node_modules/.bin`; fix `update` alias to include `brew update`

## Impact

- `cachyos-config.fish`: primary file for all additions
- External tools required: `fzf`, `zoxide`, `pyenv`, `kubectl`, `kubectx`, `gcloud` SDK (already installed per zsh config)
- iTerm2 integration requires `~/.iterm2_shell_integration.fish` to exist (fish-specific file)
