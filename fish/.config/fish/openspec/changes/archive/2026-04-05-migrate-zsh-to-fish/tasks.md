## 1. Path & Alias Fixes

- [x] 1.1 Fix the `update` alias in `cachyos-config.fish` to use `brew update && brew upgrade && brew cleanup`
- [x] 1.2 Add `set -x PATH ./node_modules/.bin $PATH` in `cachyos-config.fish` for per-session relative PATH

## 2. fzf Integration

- [x] 2.1 Add a `command -q fzf` guard block in `cachyos-config.fish` that runs `fzf --fish | source`

## 3. zoxide Integration

- [x] 3.1 Add a `command -q zoxide` guard block in `cachyos-config.fish` that runs `zoxide init --cmd cd fish | source`

## 4. pyenv Integration

- [x] 4.1 Add a `command -q pyenv` guard block in `cachyos-config.fish` that runs `pyenv init - fish | source`
- [x] 4.2 Inside the same block, conditionally run `pyenv virtualenv-init - fish | source` if `pyenv virtualenv-init` is available

## 5. Cloud & Kubernetes Tools

- [x] 5.1 Add a `command -q kubectl` guard block that runs `kubectl completion fish | source`
- [x] 5.2 Add a gcloud guard block that checks for the Homebrew SDK path (`(brew --prefix)/share/google-cloud-sdk`) and sources `path.fish.inc` and `completion.fish.inc` when found

## 6. iTerm2 Integration

- [x] 6.1 Add a conditional block in `cachyos-config.fish` that sources `~/.iterm2_shell_integration.fish` when `TERM_PROGRAM = iTerm.app` and the file exists
