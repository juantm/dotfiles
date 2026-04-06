## MODIFIED Requirements

### Requirement: ssh package contains all ssh configs
The `ssh/` stow package SHALL be the single source of truth for SSH configuration. The root-level `config` file (a fragment of SSH global settings) SHALL be reviewed against `ssh/.ssh/config` and removed if its content is already covered.

#### Scenario: no ssh config fragment remains at repo root
- **WHEN** the ssh package consolidation is complete
- **THEN** a file named `config` (bare, not `.ssh/config`) does not exist at the repo root
