## ADDED Requirements

### Requirement: ./node_modules/.bin is on the PATH per session
The shell SHALL prepend `./node_modules/.bin` to `$PATH` for each interactive session so local npm binaries can be run without the full path.

#### Scenario: local npm binary is runnable
- **WHEN** the user is in a directory with `node_modules/.bin/eslint`
- **THEN** typing `eslint` runs the local binary without `npx` or a full path

### Requirement: update alias includes brew update
The `update` alias SHALL run `brew update && brew upgrade && brew cleanup` (in that order) to ensure the Homebrew formula index is refreshed before upgrading.

#### Scenario: update alias refreshes Homebrew index
- **WHEN** the user runs `update`
- **THEN** `brew update` runs first, followed by `brew upgrade`, followed by `brew cleanup`
