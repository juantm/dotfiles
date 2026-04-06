## ADDED Requirements

### Requirement: kubectl completions are available in fish
The shell SHALL source kubectl tab completions via `kubectl completion fish | source` when kubectl is installed.

#### Scenario: kubectl tab completion works
- **WHEN** the user types `kubectl get <Tab>` in an interactive session
- **THEN** resource types are suggested by completion

#### Scenario: kubectl not installed
- **WHEN** kubectl is not present on the system
- **THEN** fish starts without error

### Requirement: gcloud SDK is initialized in fish
The shell SHALL source the gcloud SDK fish completions and path helper from the Homebrew-managed location when present.

#### Scenario: gcloud completion works
- **WHEN** gcloud is installed via Homebrew and the SDK path exists
- **THEN** `gcloud` tab completion and `gcloud` command are available

#### Scenario: gcloud SDK not found
- **WHEN** the expected gcloud SDK path does not exist
- **THEN** fish starts without error
