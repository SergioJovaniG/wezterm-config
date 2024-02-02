-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.keys = {
	{ key = "k", mods = "CMD|SHIFT", action = act.ClearScrollback("ScrollbackAndViewport") },
	{ key = "w", mods = "CMD|SHIFT", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
	{ key = "p", mods = "CMD|SHIFT", action = wezterm.action.ShowLauncher },
	{ key = "v", mods = "CMD|SHIFT", action = wezterm.action.SplitVertical },
	{ key = "h", mods = "CMD|SHIFT", action = wezterm.action.SplitHorizontal },
	{ key = "LeftArrow", mods = "CMD|SHIFT", action = act.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "CMD|SHIFT", action = act.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "CMD|SHIFT", action = act.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "CMD|SHIFT", action = act.ActivatePaneDirection("Down") },
	{ key = "LeftArrow", mods = "CMD|SHIFT|OPT", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ key = "DownArrow", mods = "CMD|SHIFT|OPT", action = act.AdjustPaneSize({ "Down", 5 }) },
	{ key = "UpArrow", mods = "CMD|SHIFT|OPT", action = act.AdjustPaneSize({ "Up", 5 }) },
	{ key = "RightArrow", mods = "CMD|SHIFT|OPT", action = act.AdjustPaneSize({ "Right", 5 }) },
	{ key = "LeftArrow", mods = "CMD|OPT", action = act.ActivateTabRelative(-1) },
	{ key = "RightArrow", mods = "CMD|OPT", action = act.ActivateTabRelative(1) },
	{ key = "U", mods = "CTRL", action = act.ScrollByPage(-1) },
	{ key = "D", mods = "CTRL", action = act.ScrollByPage(1) },
}

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Afterglow"

-- Front
config.font = wezterm.font("GeistMono Nerd Font")

-- and finally, return the configuration to wezterm
return config
