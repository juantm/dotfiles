## 1. Stow Package Structure

- [x] 1.1 Create `.stow-local-ignore` in `zsh/` with entries to exclude `openspec` and `.github`
- [x] 1.2 Copy `~/.zshrc` into `zsh/.zshrc`
- [x] 1.3 Copy `~/.zshenv` into `zsh/.zshenv`
- [x] 1.4 Copy `~/.zprofile` into `zsh/.zprofile`
- [x] 1.5 Create `zsh/.zsh/completions/` directory and copy `~/.zsh/completions/_openspec` into it

## 2. Speed Optimizations

- [x] 2.1 In `zsh/.zshenv`: replace sequential `export PATH="...:$PATH"` appends with a single consolidated `export PATH="a:b:c:...:$PATH"` statement
- [x] 2.2 In `zsh/.zshrc`: add cache dir creation (`mkdir -p ~/.cache/zsh`) and replace `eval "$(fzf --zsh)"` with a mtime-checked cache pattern that writes to `~/.cache/zsh/fzf-init.zsh` and sources it
- [x] 2.3 In `zsh/.zshrc`: apply the same mtime-checked cache pattern for `eval "$(zoxide init --cmd cd zsh)"` → `~/.cache/zsh/zoxide-init.zsh`
- [x] 2.4 In `zsh/.zshrc`: remove the `_load_shell_integrations` function, the `_load_integrations_hook` precmd hook, and the `(sleep 2 && ...) &` block
- [x] 2.5 In `zsh/.zshrc`: add zinit `wait` directives for the OMZ snippets (brew, gcloud, pyenv, kubectl, kubectx, command-not-found) that were previously deferred inside the background subshell
- [x] 2.6 In `zsh/.zshrc`: move iterm2 integration sourcing into a zinit `wait` block to keep it deferred without the sleep trick

## 3. Wire up Stow

- [x] 3.1 Run `stow --simulate zsh` from repo root and confirm no conflicts
- [x] 3.2 Back up live originals: `mv ~/.zshrc ~/.zshrc.pre-stow`, same for `.zshenv` and `.zprofile`
- [x] 3.3 Run `stow zsh` from repo root
- [x] 3.4 Verify symlinks exist: `ls -la ~/.zshrc ~/.zshenv ~/.zprofile ~/.zsh/completions/`

## 4. Verify

- [x] 4.1 Open a new shell and confirm it starts without errors
- [x] 4.2 Benchmark startup: `time zsh -i -c exit` — compare against pre-change baseline (~872ms)
- [x] 4.3 Confirm fzf keybindings work (Ctrl-R history, Ctrl-T file search) after shell integrations load
- [x] 4.4 Confirm `~/openspec` and `~/.github` were NOT created as symlinks by stow
