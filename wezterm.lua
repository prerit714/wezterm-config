local wezterm = require("wezterm")
local mux = wezterm.mux

-- Open wezterm in maximized mode by default
wezterm.on("gui-startup", function()
	local _, _, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Font config
config.color_scheme = "Tokyo Night Moon"
config.font = wezterm.font("IosevkaTerm NFM", {
	stretch = "Expanded",
	weight = "Bold",
})
config.font_size = 24

-- Config for padding
config.window_padding = {
	left = 5,
	right = 5,
	top = 5,
	bottom = 5,
}

-- Hide native tabs since I use tmux
config.enable_tab_bar = false

-- Launching tmux at start
config.default_prog = {
	"tmux",
}

return config
