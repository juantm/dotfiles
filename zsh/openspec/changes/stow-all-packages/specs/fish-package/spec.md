## ADDED Requirements

### Requirement: fish config is stow-managed
The `config.fish` file at repo root SHALL be moved into a `fish/` stow package at `fish/.config/fish/config.fish`.

#### Scenario: fish package symlinks correctly
- **WHEN** `stow fish` is run from the repo root
- **THEN** `~/.config/fish/config.fish` is a symlink to the repo file
