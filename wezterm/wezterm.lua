local wezterm = require("wezterm")
-- This will hold the configuration.
local config = wezterm.config_builder()
config.color_scheme = "nord"
config.font = wezterm.font("Hack Nerd Font")
config.font_size = 14
config.hide_tab_bar_if_only_one_tab = true
config.adjust_window_size_when_changing_font_size = false
config.window_padding = {
	top = 0,
	left = 0,
	right = 0,
	bottom = 0,
}
config.window_background_opacity = 0.9
config.line_height = 1.2
config.leader = { key = ";", mods = "CTRL", timeout_milliseconds = 1000 }
local wezterm = require("wezterm")

config.keys = {
	{
		key = "|",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "h",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "j",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "p",
		mods = "LEADER",
		action = wezterm.action.QuickSelectArgs({
			label = "open url",
			patterns = {
				"https?://\\S+",
			},
			action = wezterm.action_callback(function(window, pane)
				local url = window:get_selection_text_for_pane(pane)
				wezterm.log_info("opening: " .. url)
				wezterm.open_with(url)
			end),
		}),
	},
	{
		key = "Space",
		mods = "LEADER",
		action = wezterm.action.ActivateCopyMode,
	},
	{
		key = "d",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "v",
		mods = "CTRL",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
}
return config
