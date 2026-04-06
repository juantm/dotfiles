### Requirement: pyenv initializes Python version management in fish
The shell SHALL run `pyenv init - fish | source` to shim `python`/`pip` commands, and SHALL additionally run `pyenv virtualenv-init - fish | source` when pyenv-virtualenv is available.

#### Scenario: pyenv shims python
- **WHEN** pyenv is installed and a local `.python-version` file is present
- **THEN** `python` resolves to the pyenv-managed version, not the system Python

#### Scenario: pyenv-virtualenv auto-activates
- **WHEN** pyenv-virtualenv is installed and the current directory has a matching virtualenv
- **THEN** the virtualenv is automatically activated on directory entry

#### Scenario: pyenv not installed
- **WHEN** pyenv is not present on the system
- **THEN** fish starts without error and the system Python is used
