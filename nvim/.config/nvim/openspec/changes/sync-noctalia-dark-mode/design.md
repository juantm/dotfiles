## Context

Neovim is currently static in its theme choice (catppuccin-latte). The system uses Noctalia Shel, which stores the current dark mode state as a boolean in `~/.config/noctalia/settings.json`. To align the two, Neovim needs to be able to read this file and react to changes in real-time.

## Goals / Non-Goals

**Goals:**
- Synchronize Neovim's colorscheme with Noctalia's `darkMode` setting.
- Support real-time switching using `neovim-remote` (nvr).
- ensure the correct theme is loaded on Neovim startup.
- map `darkMode: false` -> `catppuccin-latte` and `darkMode: true` -> `catppuccin-mocha`.

**Non-Goals:**
- Create a custom colorscheme (use existing Catppuccin flavors).
- Implement automatic wallpaper-based color extraction in Neovim.

## Decisions

- **Communication Method**: Use `neovim-remote` (nvr) for the push mechanism.
  - *Rationale*: High reliability and low latency compared to file-watching polling in Lua.
- **Logic Location**: The logic for theme selection resides entirely within Neovim.
  - *Rationale*: Keeps the system hook simple (a one-liner) and prevents fragile shell scripting for theme mapping.
- **State Retrieval**: Directly read and parse `~/.config/noctalia/settings.json` using `vim.json.decode`.
  - *Rationale*: The file is small and JSON is natively supported by Neovim.

## Risks / Trade-offs

- **External Dependency**: Dependency on `neovim-remote`binary.
  - *Mitigation*: Document as a prerequisite in the task list.
- **Performance**: Frequent file reads if the hook is triggered rapidly.
  - *Mitigation*: The hook only fires on theme change, which is an infrequent event.
- **RPC Server**: Assumes Neovim is running with a server socket.
  - *Mitigation*: Standard behavior for most Neovim installs; `nvr` handles the socket discovery.
