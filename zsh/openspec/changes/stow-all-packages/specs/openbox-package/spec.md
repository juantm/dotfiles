## ADDED Requirements

### Requirement: openbox autostart is stow-managed
The `autostart` file at repo root SHALL be moved into an `openbox/` stow package at `openbox/.config/openbox/autostart`.

#### Scenario: openbox package symlinks correctly
- **WHEN** `stow openbox` is run from the repo root
- **THEN** `~/.config/openbox/autostart` is a symlink to the repo file
