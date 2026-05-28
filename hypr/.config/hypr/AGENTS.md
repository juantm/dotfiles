# Agents Guide

## Architecture
- **Configuration Split**: Logic is divided between `hyprland.conf` (minimal stub/colors) and `hyprland.lua` (main modular configuration).
- **Lua Modules**: Component-specific settings are located in `modules/*.lua`.
- **Themes & Colors**: 
  - Themes: `themes/*.lua`
  - Colors: `noctalia/noctalia-colors.conf` and `scheme/current.conf`

## Conventions
- When updating system settings, prioritize the corresponding file in `modules/`.
- Maintain the distinction between the `.conf` stub and the `.lua` modular system.
