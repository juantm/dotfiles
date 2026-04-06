## ADDED Requirements

### Requirement: compton config is stow-managed
The `compton.conf` file at repo root SHALL be moved into a `compton/` stow package at `compton/.config/compton/compton.conf`.

#### Scenario: compton package symlinks correctly
- **WHEN** `stow compton` is run from the repo root
- **THEN** `~/.config/compton/compton.conf` is a symlink to the repo file
