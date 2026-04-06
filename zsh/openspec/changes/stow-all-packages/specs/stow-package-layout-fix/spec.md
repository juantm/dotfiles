## ADDED Requirements

### Requirement: Stow packages mirror $HOME layout
All stow packages in the repo SHALL have an internal directory structure that mirrors `$HOME`, so that `stow <package>` run from the repo root correctly symlinks files into `$HOME`.

#### Scenario: New package is stow-installable
- **WHEN** a package directory is created with files at the correct mirrored path
- **THEN** running `stow <package>` from repo root creates symlinks at the correct `$HOME` locations without errors

### Requirement: Broken packages are restructured
The packages `sway/`, `waybar/`, `wofi/`, and `wlogout/` SHALL have their config files moved from the package root into the proper `$HOME`-mirroring path (e.g., `sway/.config/sway/config`).

#### Scenario: sway package is stow-installable after fix
- **WHEN** `sway/config` is moved to `sway/.config/sway/config`
- **THEN** `stow sway` creates `~/.config/sway/config` symlink

#### Scenario: waybar package is stow-installable after fix
- **WHEN** `waybar/config` and `waybar/style.css` are moved to `waybar/.config/waybar/`
- **THEN** `stow waybar` creates symlinks under `~/.config/waybar/`

#### Scenario: wofi package is stow-installable after fix
- **WHEN** `wofi/config` and `wofi/style.css` are moved to `wofi/.config/wofi/`
- **THEN** `stow wofi` creates symlinks under `~/.config/wofi/`

#### Scenario: wlogout package is stow-installable after fix
- **WHEN** `wlogout/layout` and `wlogout/style.css` are moved to `wlogout/.config/wlogout/`
- **THEN** `stow wlogout` creates symlinks under `~/.config/wlogout/`
