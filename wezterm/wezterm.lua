-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux
local mapping = require("keybinds")

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.scrollback_lines = 10000

-- Style
config.color_scheme = "Tokyo Night Storm"
config.window_background_opacity = 0.5
config.macos_window_background_blur = 3
----------------------------------------------------
-- Tab
----------------------------------------------------
-- タイトルバーを非表示
config.window_decorations = "RESIZE"
-- タブバーの表示
config.show_tabs_in_tab_bar = true
-- タブが一つの時は非表示
config.hide_tab_bar_if_only_one_tab = false

-- config.show_close_tab_button_in_tabs = false

-- タブバーの透過
config.window_frame = {
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
}

-- タブバーを背景色に合わせる
config.window_background_gradient = {
	colors = { "#000000" },
}

-- タブタイトルのフォーマット
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local background = "#5c6d74"
	local foreground = "#FFFFFF"
	local edge_background = "none"

	if tab.is_active then
		background = "#9c7af2"
		foreground = "#FFFFFF"
	end

	local edge_foreground = background
	local title = tab.active_pane.title

	-- タイトルが長い場合は省略
	local function get_last_n_chars(str, n)
		if #str <= n then
			return str
		else
			return "…" .. string.sub(str, -n + 1)
		end
	end

	-- プロセス名に基づいてタイトルを取得する関数(nodeとかmakeとか表示)
	local function get_process_name(pane)
		local process_name = pane.foreground_process_name

		return process_name:match("([^/]+)$") or ""
	end

	-- カスタムタイトルを取得する関数
	local function get_custom_title(pane)
		local process_name = get_process_name(pane)

		if process_name ~= "zsh" then
			return process_name
		else
			return get_last_n_chars(title, 23)
		end

		return process_name
	end

	-- カスタムタイトルを取得
	local custom_title = get_custom_title(tab.active_pane)

	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = " " .. (tab.tab_index + 1) .. ": " .. custom_title .. " " },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)

config.leader = mapping.leader
config.keys = mapping.keys

-- and finally, return the configuration to wezterm
return config
