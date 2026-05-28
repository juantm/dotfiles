## ADDED Requirements

### Requirement: Sync with Noctalia State
The system MUST read the `darkMode` boolean from `~/.config/noctalia/settings.json` and update the Neovim colorscheme accordingly.

#### Scenario: Sync to Dark Mode
- **WHEN** `darkMode` is set to `true` in `settings.json` and the sync trigger occurs
- **THEN** Neovim SHALL set the colorscheme to `catppuccin-mocha`

#### Scenario: Sync to Light Mode
- **WHEN** `darkMode` is set to `false` in `settings.json` and the sync trigger occurs
- **THEN** Neovim SHALL set the colorscheme to `catppuccin-latte`

### Requirement: Direct Remote Trigger
The system MUST allow an external process to trigger the synchronization function via a remote call.

#### Scenario: External trigger via nvr
- **WHEN** the command `nvr --remote-send ':lua require("noctalia_sync").sync()<CR>'` is executed
- **THEN** Neovim SHALL immediately execute the sync logic and update the theme

### Requirement: Startup Synchronization
The system MUST synchronize the theme state during the Neovim initialization process.

#### Scenario: Correct theme on boot
- **WHEN** Neovim is launched
- **THEN** Neovim SHALL read the current Noctalia state and apply the corresponding theme before the UI is fully rendered
