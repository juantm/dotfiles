## MODIFIED Requirements

### Requirement: doom emacs package contains all doom configs
The `doom/` stow package SHALL contain all Doom Emacs config files (`config.el`, `init.el`, `packages.el`, `custom.el`) under `doom/.config/doom/`. Root-level duplicates SHALL be removed after confirming they are identical to or older than the versions inside the package.

#### Scenario: no doom configs remain at repo root
- **WHEN** the doom package consolidation is complete
- **THEN** `config.el`, `init.el`, `packages.el`, and `custom.el` do not exist at the repo root
