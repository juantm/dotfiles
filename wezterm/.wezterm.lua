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
-- config.font = wezterm.font_with_fallback {'Cozette', 'Iosevka Term SS07', 'MesloLGS NF'}
-- config.font = wezterm.font_with_fallback { 'Terminus (TTF)', 'Terminess Nerd Font', 'MesloLGS NF'}
config.font = wezterm.font_with_fallback({ "Iosevka Term SS07", "IosevkaTerm Nerd Font" })
config.font_size = 16.0

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
