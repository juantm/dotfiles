-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Set initial window size in character cells
config.initial_rows = 40
config.initial_cols = 160

config.window_background_opacity = 0.74 -- opacity as you please
if wezterm.target_triple == "x86_64-apple-darwin" then
	config.macos_window_background_blur = 20
else
	config.kde_window_background_blur = true
end

-- This is where you actually apply your config choices
-- config.font = wezterm.font_with_fallback {'Cozette', 'Iosevka Term SS05', 'MesloLGS NF'}
-- config.font = wezterm.font_with_fallback { 'Terminus (TTF)', 'Terminess Nerd Font', 'MesloLGS NF'}
-- config.font = wezterm.font_with_fallback({ "Iosevka SS05", "IosevkaTerm Nerd Font" })
local fuentes = {}
fuentes = wezterm.font_with_fallback({
	--  { family = "Dank Mono", weight = "Bold" },
	--  { family = "Dank Mono", weight = 400 },
	--  { family = "Cozette", weight = "Regular" },
	--- { family = "Victor Mono", weight = 400 },
	{
		--  family = "Consolas ligaturized v3",
		family = "Fira Code iScript",
		--  family = "LigaConsola Nerd Font",
		--  weight = "Light",
		harfbuzz_features = { "zero", "ss01", "ss02", "ss03", "ss07", "cv24", "cv31" },
	},
	{
		-- family = "CaskaydiaCove Nerd Font",
		family = "Victor Mono",
		weight = "Regular",
	},
})
config.font = fuentes
local font_size = 11.0
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
