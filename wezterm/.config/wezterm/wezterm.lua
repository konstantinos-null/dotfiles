local wezterm = require 'wezterm'

local config = {}


config.color_scheme = 'kanagawa (Gogh)'
-- config.color_scheme = 'Alabaster'
config.font = wezterm.font 'Cascadia Code PL'


config.enable_tab_bar = false
config.exit_behavior = 'Hold'
config.window_close_confirmation = 'NeverPrompt'

return config
