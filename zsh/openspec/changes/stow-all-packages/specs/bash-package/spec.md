## ADDED Requirements

### Requirement: bash config is stow-managed
The `bash_profile` file at repo root SHALL be moved into a `bash/` stow package at `bash/.bash_profile`.

#### Scenario: bash package symlinks correctly
- **WHEN** `stow bash` is run from the repo root
- **THEN** `~/.bash_profile` is a symlink to the repo file
