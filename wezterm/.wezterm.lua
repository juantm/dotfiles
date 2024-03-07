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
config.font = wezterm.font_with_fallback({ "Dank Mono", "MesloLGS NF" })
local font_size = 14.0
if wezterm.target_triple == 'x86_64-apple-darwin' then
  font_size = 18.0
end
config.font_size = font_size

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Frappe"
	else
		return "Catppuccin Latte"
	end
end

-- For example, changing the color scheme:
config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
-- and finally, return the configuration to wezterm
-- config.default_prog = { '/usr/local/bin/tmux', '-2' }
config.hide_tab_bar_if_only_one_tab = true
return config
