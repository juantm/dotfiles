## ADDED Requirements

### Requirement: tint2 config is stow-managed
The `tint2rc` file at repo root SHALL be moved into a `tint2/` stow package at `tint2/.config/tint2/tint2rc`.

#### Scenario: tint2 package symlinks correctly
- **WHEN** `stow tint2` is run from the repo root
- **THEN** `~/.config/tint2/tint2rc` is a symlink to the repo file
