### Requirement: iTerm2 shell integration is sourced when running inside iTerm2
The shell SHALL source `~/.iterm2_shell_integration.fish` when both the file exists and the environment variable `TERM_PROGRAM` equals `iTerm.app`.

#### Scenario: iTerm2 integration loads inside iTerm2
- **WHEN** fish starts inside iTerm2 (TERM_PROGRAM=iTerm.app) and `~/.iterm2_shell_integration.fish` exists
- **THEN** iTerm2 shell features (marks, semantic history, etc.) are active

#### Scenario: iTerm2 integration skipped outside iTerm2
- **WHEN** fish starts in a terminal other than iTerm2
- **THEN** the integration file is not sourced and fish starts without error

#### Scenario: iTerm2 integration file missing
- **WHEN** `~/.iterm2_shell_integration.fish` does not exist
- **THEN** fish starts without error
