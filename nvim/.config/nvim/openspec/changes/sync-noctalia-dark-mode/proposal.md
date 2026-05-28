## Why

Currently, Neovim is hardcoded to a specific colorscheme (catppuccin-latte), ignoring the system-wide dark/light mode state managed by Noctalia Shel. This results in a mismatch between the editor and the rest of the desktop environment.

## What Changes

- Introduce a Neovim bridge that reads the system color mode from `~/.config/noctalia/settings.json`.
- Implement a real-time update mechanism using `neovim-remote` (nvr) to trigger theme switches without restarting Neovim.
- Add a startup check to ensure Neovim launches with the current system theme.

## Capabilities

### New Capabilities
- `noctalia-theme-sync`: Ability for Neovim to synchronize its colorscheme with the Noctalia dark/light mode setting.

### Modified Capabilities

## Impact

- Neovim configuration files (lua/config/ and lua/plugins/).
- System dependencies: requires `neovim-remote` to be installed on the host system.
- Noctalia configuration: requires updating `settings.json` with a custom hook.
