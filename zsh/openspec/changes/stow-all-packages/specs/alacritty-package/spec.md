## ADDED Requirements

### Requirement: alacritty config is stow-managed
The `alacritty.yml` file at repo root SHALL be moved into an `alacritty/` stow package at the path `alacritty/.config/alacritty/alacritty.yml`.

#### Scenario: alacritty package symlinks correctly
- **WHEN** `stow alacritty` is run from the repo root
- **THEN** `~/.config/alacritty/alacritty.yml` is a symlink to the repo file
