## ADDED Requirements

### Requirement: zsh config files are tracked in the stow package
The `zsh/` stow package SHALL contain `.zshrc`, `.zshenv`, `.zprofile`, and `.zsh/completions/` at paths that mirror `$HOME`, so that `stow zsh` run from the repo root symlinks them correctly.

#### Scenario: stow zsh creates all zsh config symlinks
- **WHEN** `stow zsh` is run from the repo root after removing the originals
- **THEN** `~/.zshrc`, `~/.zshenv`, `~/.zprofile`, and `~/.zsh/completions/_openspec` are symlinks into the repo

### Requirement: openspec and .github are excluded from stow
The `zsh/` package SHALL include a `.stow-local-ignore` file that prevents `openspec/` and `.github/` from being symlinked into `$HOME`.

#### Scenario: openspec is not symlinked by stow
- **WHEN** `stow zsh` is run from the repo root
- **THEN** `~/openspec` is NOT created as a symlink

#### Scenario: .github is not symlinked by stow
- **WHEN** `stow zsh` is run from the repo root
- **THEN** `~/.github` is NOT created as a symlink (unless it already exists independently)

### Requirement: stow simulate passes with no conflicts
Running `stow --simulate zsh` after removing the original files SHALL complete without errors.

#### Scenario: stow simulate succeeds
- **WHEN** live zsh config files are backed up and removed, then `stow --simulate zsh` is run
- **THEN** no conflict or error is reported
