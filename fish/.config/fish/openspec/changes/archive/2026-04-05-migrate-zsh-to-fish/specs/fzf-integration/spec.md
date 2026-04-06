## ADDED Requirements

### Requirement: fzf keybindings are active in fish
The shell SHALL initialize fzf key bindings so Ctrl-R triggers fuzzy history search and Ctrl-T triggers fuzzy file picker, using `fzf --fish | source` when fzf ≥ 0.48 is available.

#### Scenario: Ctrl-R opens fuzzy history search
- **WHEN** the user presses Ctrl-R in an interactive fish session
- **THEN** fzf opens with the shell history for fuzzy searching

#### Scenario: Ctrl-T opens fuzzy file picker
- **WHEN** the user presses Ctrl-T in an interactive fish session
- **THEN** fzf opens a fuzzy file picker rooted at the current directory

#### Scenario: fzf not installed
- **WHEN** fzf is not present on the system
- **THEN** fish starts without error and no fzf bindings are registered
