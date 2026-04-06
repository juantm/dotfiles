## ADDED Requirements

### Requirement: fzf and zoxide init output is cached
The `.zshrc` SHALL cache the output of `fzf --zsh` and `zoxide init --cmd cd zsh` to files under `~/.cache/zsh/` and source those files instead of re-evaling the commands on every shell start. The cache SHALL be regenerated automatically when the corresponding binary's modification time changes.

#### Scenario: cache is sourced on subsequent shell starts
- **WHEN** the fzf and zoxide cache files already exist and the binaries have not changed
- **THEN** `.zshrc` sources the cache files directly without forking fzf or zoxide processes

#### Scenario: cache is regenerated after tool update
- **WHEN** the fzf or zoxide binary has a newer mtime than its cache file
- **THEN** `.zshrc` re-runs the eval command, updates the cache file, and sources it

### Requirement: OMZ snippets load in the interactive shell via zinit wait
The `.zshrc` SHALL load OMZ snippets (brew, gcloud, pyenv, kubectl, kubectx, command-not-found) using `zinit ice wait lucid` so they load asynchronously in the actual interactive shell, not in a background subshell.

#### Scenario: OMZ snippet aliases available after prompt appears
- **WHEN** a new interactive shell is opened and a few seconds pass
- **THEN** aliases and functions defined by the loaded snippets are available without sourcing anything manually

### Requirement: no background sleep subprocess
The `.zshrc` SHALL NOT use a `(sleep N && ...) &` pattern to defer shell initialization. Deferred work SHALL use zinit's `wait` mechanism or `zsh-defer`.

#### Scenario: no sleep subprocess spawned at shell start
- **WHEN** a new interactive shell is started
- **THEN** `ps aux` does not show a `sleep` process spawned by the shell init

### Requirement: PATH is a single consolidated export
The `.zshenv` SHALL set `PATH` as a single `export PATH="..."` statement rather than sequential appends.

#### Scenario: PATH is set in one statement
- **WHEN** `.zshenv` is sourced
- **THEN** PATH contains all required directories and was set by exactly one export statement
