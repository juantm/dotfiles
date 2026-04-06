## ADDED Requirements

### Requirement: scripts are stow-managed
The shell scripts `doble.sh` and `multimon.sh` at repo root SHALL be moved into a `scripts/` stow package under `scripts/.local/bin/`, making them available in `~/.local/bin/` after stowing.

#### Scenario: scripts package symlinks correctly
- **WHEN** `stow scripts` is run from the repo root
- **THEN** `~/.local/bin/doble.sh` and `~/.local/bin/multimon.sh` are symlinks to the repo files
