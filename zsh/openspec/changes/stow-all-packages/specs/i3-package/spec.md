## ADDED Requirements

### Requirement: i3 config is stow-managed
The `i3.config` file at repo root SHALL be moved into an `i3/` stow package at `i3/.config/i3/config`.

#### Scenario: i3 package symlinks correctly
- **WHEN** `stow i3` is run from the repo root
- **THEN** `~/.config/i3/config` is a symlink to the repo file
