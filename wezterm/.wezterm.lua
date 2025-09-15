-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
-- config.font = wezterm.font_with_fallback {'Cozette', 'Iosevka Term SS05', 'MesloLGS NF'}
-- config.font = wezterm.font_with_fallback { 'Terminus (TTF)', 'Terminess Nerd Font', 'MesloLGS NF'}
-- config.font = wezterm.font_with_fallback({ "Iosevka SS05", "IosevkaTerm Nerd Font" })
local fuentes = {}
fuentes = wezterm.font_with_fallback({
	--  { family = "Dank Mono", weight = "Bold" },
	{ family = "Dank Mono", weight = 400 },
	--  { family = "Cozette", weight = "Regular" },
	--  { family = "Victor Mono", weight = 600 },
	{ family = "CaskaydiaCove Nerd Font", weight = "Regular" },
})
config.font = fuentes
local font_size = 14.0
if wezterm.target_triple == "x86_64-apple-darwin" then
	font_size = 16.0
end

config.font_size = font_size

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Macchiato"
	else
		return "Catppuccin Latte"
	end
end

-- For example, changing the color scheme:
config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
-- config.color_scheme = "Catppuccin Macchiato"
-- and finally, return the configuration to wezterm
-- config.default_prog = { '/usr/local/bin/tmux', '-2' }
config.hide_tab_bar_if_only_one_tab = true
return config
