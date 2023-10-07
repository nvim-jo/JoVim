local M = {}
local catppuccin = require("catppuccin")
local mocha = require("catppuccin.palettes").get_palette("mocha")
local utils = require('catppuccin.utils.colors')
local my_palette = require('jovim.setup.catppuccin.utils').palette
local colors = require('jovim.setup.catppuccin.utils').colors

local default_overrides = {
	MarkingWindow = { fg = my_palette.text },
	MarkingBorder = { fg = my_palette.blue },

	CursorLine = { bg = my_palette.mantle },
	CursorColumn = { bg = my_palette.mantle },
	Visual = { bg = my_palette.mantle },

	FloatBorder = {
		fg = my_palette.blue,
		bg = my_palette.none,
	},

	NormalFloat = {
		bg = my_palette.none
	},

	FloatTitle = {
		fg = my_palette.text
	},

	-- For native lsp configs
	DiagnosticVirtualTextError = { bg = my_palette.none },
	DiagnosticVirtualTextWarn = { bg = my_palette.none },
	DiagnosticVirtualTextInfo = { bg = my_palette.none },
	DiagnosticVirtualTextHint = { bg = my_palette.none },
	LspInfoBorder = { fg = my_palette.blue, bg = my_palette.none, },

	-- For indent-blankline
	IndentBlanklineChar = { fg = utils.darken(my_palette.surface0, 0.40, my_palette.mantle), style = {} },
	IndentBlanklineContextChar = { fg = my_palette.lavender, style = { "bold" } },
	IndentBlanklineContextStart = { sp = my_palette.lavender, style = { "underline" } },

	Pmenu = { bg = my_palette.none },
	PmenuSel = { fg = my_palette.sapphire, bg = my_palette.none },
	PmenuSbar = { bg = my_palette.none },  -- Popup menu: scrollbar.
	PmenuThumb = { bg = my_palette.mauve }, -- Popup menu: Thumb of the scrollbar.

	VertSplit = { fg = my_palette.surface0 },
	NonText = { fg = my_palette.surface0 },
	HlSearchLensNear = { fg = my_palette.sky, bg = mocha.surface0 },
	HlSearchLens = { fg = my_palette.sky, bg = mocha.surface1 },
	GitSignsAdd = { fg = my_palette.diff.add },
	GitSignsChange = { fg = my_palette.diff.change },
	GitSignsDelete = { fg = my_palette.diff.delete },

	TabLineSel = { bg = my_palette.red },

	-- telescope
	-- For telescope.nvim
	TelescopeBorder = {
		fg = my_palette.blue,
		bg = my_palette.none,
	},
	TelescopePromptBorder = {
		fg = my_palette.blue,
		bg = my_palette.none,
	},
	TelescopePromptNormal = {
		fg = my_palette.text,
		bg = my_palette.none,
	},
	TelescopePromptPrefix = {
		fg = my_palette.flamingo,
		bg = my_palette.none,
	},
	TelescopeNormal = {
		bg = my_palette.none,
	},
	TelescopePreviewTitle = {
		fg = my_palette.green,
		bg = my_palette.none,
	},
	TelescopePromptTitle = {
		fg = my_palette.red,
		bg = my_palette.none,
	},
	TelescopeResultsTitle = {
		fg = my_palette.mantle,
		bg = my_palette.none,
	},
	TelescopeSelection = {
		fg = my_palette.green,
		bg = my_palette.none,
	},
	TelescopeResultsDiffAdd = { fg = my_palette.green },
	TelescopeResultsDiffChange = { fg = my_palette.yellow },
	TelescopeResultsDiffDelete = { fg = my_palette.red },

	["@keyword.return"] = { fg = my_palette.pink, style = {} },

	MiniIndentscopeSymbol = { fg = my_palette.blue },
	IlluminatedWordText = { bg = utils.darken(my_palette.surface0, 0.3, my_palette.mantle) },
	IlluminatedWordRead = { bg = utils.darken(my_palette.surface0, 0.3, my_palette.mantle) },
	IlluminatedWordWrite = { bg = utils.darken(my_palette.surface0, 0.3, my_palette.mantle) },

	NoiceCmdlineIcon = { fg = my_palette.mauve },
	NoiceCmdlinePopupBorder = { fg = my_palette.blue },
	NoiceCmdlinePopupTitle = { fg = my_palette.text },

	MatchParen = { fg = my_palette.blue, bg = utils.darken(my_palette.surface0, 0.3, my_palette.mantle), style = { "bold" } },
}

local jotree_highlight = require('jovim.setup.catppuccin.highlights.jotree')
local cmp_highlight = require('jovim.setup.catppuccin.highlights.cmp')

local highlight_overrides = vim.tbl_deep_extend("force", default_overrides, jotree_highlight, cmp_highlight)

M.overrides = {
	colors = {
		all = colors,
	},
	highlights = {
		all = highlight_overrides
	},
}

return M
