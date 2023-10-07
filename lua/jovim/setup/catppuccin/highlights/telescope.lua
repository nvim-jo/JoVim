local C = require('jovim.setup.catppuccin.utils').palette

return {
    TelescopeSelectionCaret = { fg = C.blue },
    TelescopeMatching = { fg = C.blue },
	TelescopeBorder = {
		fg = C.blue,
		bg = C.none,
	},
	TelescopePromptBorder = {
		fg = C.blue,
		bg = C.none,
	},
	TelescopePromptNormal = {
		fg = C.text,
		bg = C.none,
	},
	TelescopePromptPrefix = {
		fg = C.blue,
		bg = C.none,
	},
	TelescopeNormal = {
		bg = C.none,
	},
	TelescopePreviewTitle = {
		fg = C.green,
		bg = C.none,
	},
	TelescopePromptTitle = {
		fg = C.red,
		bg = C.none,
	},
	TelescopeResultsTitle = {
		fg = C.mantle,
		bg = C.none,
	},
	TelescopeSelection = {
		fg = C.green,
		bg = C.none,
        style = { "bold" },
	},
	TelescopeResultsDiffAdd = { fg = C.green },
	TelescopeResultsDiffChange = { fg = C.yellow },
	TelescopeResultsDiffDelete = { fg = C.red },
}