## ADDED Requirements

### Requirement: zoxide replaces the cd command
The shell SHALL initialize zoxide with `--cmd cd` so that typing `cd <pattern>` uses zoxide's frecency-based navigation instead of plain directory changing.

#### Scenario: cd uses zoxide for known directories
- **WHEN** the user types `cd <partial-name>` for a directory they have visited before
- **THEN** zoxide navigates to the best frecency match

#### Scenario: zoxide not installed
- **WHEN** zoxide is not present on the system
- **THEN** fish starts without error and the built-in `cd` command remains unchanged
