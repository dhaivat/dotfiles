-- -------------------------------------------------------------------
-- rxyhn's aesthetic wezterm configuration
-- A GPU-accelerated cross-platform terminal emulator and multiplexer
--
-- https://github.com/rxyhn
-- -------------------------------------------------------------------

local wezterm = require("wezterm")

local function font_with_fallback(name, params)
	local names = { name, "Apple Color Emoji", "azuki_font" }
	return wezterm.font_with_fallback(names, params)
end

local font_name = "PragmataPro Mono Liga"

return {

	-- Leader

	-- OpenGL for GPU acceleration, Software for CPU
	front_end = "OpenGL",

	-- Font config
	font = font_with_fallback(font_name),
	font_rules = {
		{
			italic = true,
			font = font_with_fallback(font_name, { italic = true, bold = true }),
		},
		{
			italic = true,
			intensity = "Bold",
			font = font_with_fallback(font_name, { italic = true, bold = true }),
		},
		{
			intensity = "Bold",
			font = font_with_fallback(font_name, { bold = true }),
		},
	},
	warn_about_missing_glyphs = false,
	font_size = 16,
	line_height = 1.0,

	-- Cursor style
	default_cursor_style = "BlinkingUnderline",

	-- X11
	enable_wayland = false,

	-- ` as the LEADER key
	leader = { key = "`", timeout_milliseconds = 1000 },
	-- Keybinds
	disable_default_key_bindings = true,
	keys = {
		{ -- quick flip between tabs with double tap
			key = "`",
			mods = "LEADER",
			action = wezterm.action.ActivateLastTab,
		},
		{
			-- when we need literal LEADER key ` (this should be)
			-- LEADER + SHIFT + ~
			key = "~",
			mods = "LEADER",
			action = wezterm.action.SendKey({ key = "`" }),
		},
		{
			key = "c",
			mods = "LEADER",
			action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
		},
		{
			key = "x",
			mods = "LEADER|SHIFT",
			action = wezterm.action({ CloseCurrentTab = { confirm = false } }),
		},
		{
			key = "n",
			mods = "LEADER",
			action = wezterm.action({ ActivateTabRelative = 1 }),
		},
		{
			key = "p",
			mods = "LEADER",
			action = wezterm.action({ ActivateTabRelative = -1 }),
		},
		{
			key = "|",
			mods = "LEADER",
			action = wezterm.action({
				SplitHorizontal = { domain = "CurrentPaneDomain" },
			}),
		},
		{
			key = "_",
			mods = "LEADER",
			action = wezterm.action({
				SplitVertical = { domain = "CurrentPaneDomain" },
			}),
		},
		{
			key = "x",
			mods = "LEADER",
			action = wezterm.action({ CloseCurrentPane = { confirm = false } }),
		},
		{
			key = "h",
			mods = "LEADER",
			action = wezterm.action({ ActivatePaneDirection = "Left" }),
		},
		{
			key = "l",
			mods = "LEADER",
			action = wezterm.action({ ActivatePaneDirection = "Right" }),
		},
		{
			key = "k",
			mods = "LEADER",
			action = wezterm.action({ ActivatePaneDirection = "Up" }),
		},
		{
			key = "j",
			mods = "LEADER",
			action = wezterm.action({ ActivatePaneDirection = "Down" }),
		},
		{
			key = "h",
			mods = "LEADER|SHIFT",
			action = wezterm.action({ AdjustPaneSize = { "Left", 1 } }),
		},
		{
			key = "l",
			mods = "LEADER|SHIFT",
			action = wezterm.action({ AdjustPaneSize = { "Right", 1 } }),
		},
		{
			key = "k",
			mods = "LEADER|SHIFT",
			action = wezterm.action({ AdjustPaneSize = { "Up", 1 } }),
		},
		{
			key = "j",
			mods = "LEADER|SHIFT",
			action = wezterm.action({ AdjustPaneSize = { "Down", 1 } }),
		},

		-- standard copy/paste bindings
		{
			key = "Escape",
			mods = "LEADER",
			action = "ActivateCopyMode",
		},
		{
			key = "p",
			mods = "LEADER|SHIFT",
			action = wezterm.action({ PasteFrom = "Clipboard" }),
		},
		{
			key = "c",
			mods = "LEADER|SHIFT",
			action = wezterm.action({ CopyTo = "ClipboardAndPrimarySelection" }),
		},
	},

	-- Aesthetic Night Colorscheme
	bold_brightens_ansi_colors = true,
	color_scheme = "Kanagawa (Gogh)",

	-- Padding
	--window_padding = {
	--	left = 25,
	--	right = 25,
	--	top = 25,
	--	bottom = 25,
	--},

	-- Tab Bar
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	show_tab_index_in_tab_bar = false,
	tab_bar_at_bottom = true,

	-- General
	automatically_reload_config = true,
	inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
	window_background_opacity = 1.0,
	window_close_confirmation = "NeverPrompt",
	window_frame = { active_titlebar_bg = "#090909", font = font_with_fallback(font_name, { bold = true }) },
}
