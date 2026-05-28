# AGENTS.md

## Architecture
- Neovim configuration based on LazyVim.
- `lua/config/`: Core settings (options, keymaps, autocmds).
- `lua/plugins/`: Plugin specifications and overrides.

## Development & Tooling
- **Formatter**: Use `stylua`.
- **Style**: 2-space indent, 120 column width (see `stylua.toml`).
- **Verification**: Changes to Lua files should be verified for syntax and formatting using `stylua`.
