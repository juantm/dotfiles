## ADDED Requirements

### Requirement: X11 configs are stow-managed
The files `.Xresources`, `.Xresources.def_dark`, `.Xresources.def_light`, and `xinitrc` at repo root SHALL be moved into an `xorg/` stow package, maintaining their dotfile names at `$HOME`.

#### Scenario: xorg package symlinks dotfiles correctly
- **WHEN** `stow xorg` is run from the repo root
- **THEN** `~/.Xresources`, `~/.Xresources.def_dark`, `~/.Xresources.def_light`, and `~/.xinitrc` are symlinks to the repo files
