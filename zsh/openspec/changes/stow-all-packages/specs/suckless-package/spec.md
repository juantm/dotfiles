## ADDED Requirements

### Requirement: suckless config is stow-managed
The `config.h` file at repo root SHALL be moved into a `suckless/` stow package at `suckless/config.h` (symlinks to `~/config.h`). Suckless tools read `config.h` at compile time from the source directory; this package serves as a reference/backup, not a runtime config.

#### Scenario: suckless package symlinks correctly
- **WHEN** `stow suckless` is run from the repo root
- **THEN** `~/config.h` is a symlink to the repo file
