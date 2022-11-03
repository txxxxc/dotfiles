local wezterm = require 'wezterm'
return {
	color_scheme = 'nord',
	font = wezterm.font 'Hack Nerd Font Mono',
	font_size = 14,
	hide_tab_bar_if_only_one_tab = true,
	tab_bar_at_bottom = true,
	adjust_window_size_when_changing_font_size = false,
	window_padding = {
    top = 0,
    left = 0,
    -- right = 0,
    bottom = 0,
  },
	window_background_opacity = 0.95,
	line_height = 1.2,
}

