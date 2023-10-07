local M = {}
local mocha = require("catppuccin.palettes").get_palette("mocha")

local mocha_overrides = {
	-- green = "#9ece6a",
	green    = "#bad4aa",
	surface0 = "#444444",
	surface1 = "#666666",
	surface2 = "#a3a7bc",
	surface3 = "#a3a7bc",
	magenta  = "#c678dd",
	cyan     = "#63cdcf",
	white    = "#dfdfe0",
	orange   = "#F4A261",
	gray     = "#2a2e36",
}

M.palette = vim.tbl_deep_extend("force", mocha, mocha_overrides, {
	warning = mocha.yellow,
	info = mocha.blue,
	hint = mocha.teal,
	variable = mocha.text,

	magenta = "#c678dd",
	cyan = "#63cdcf",
	white = "#dfdfe0",
	orange = "#F4A261",
	gray = "#2a2e36",
	none = "NONE",

	diff = {
		add = "green",
		change = "#2B5B77",
		delete = "red",
		text = mocha.blue,
		conflict = mocha.magenta,
	},
})

M.colors = mocha_overrides

return M