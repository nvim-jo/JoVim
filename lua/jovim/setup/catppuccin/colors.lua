local M = {}
local mocha = require("catppuccin.palettes").get_palette("mocha")
local utils = require('catppuccin.utils.colors')
local custom_utils = require('jovim.setup.catppuccin.utils')
local my_palette = custom_utils.palette

local jotree_highlight = require('jovim.setup.catppuccin.highlights.jotree')
local cmp_highlight = require('jovim.setup.catppuccin.highlights.cmp')
local telescope_highlight = require('jovim.setup.catppuccin.highlights.telescope')
local noice_highlight = require('jovim.setup.catppuccin.highlights.noice')
local indent_highlight = require('jovim.setup.catppuccin.highlights.indent-blank')
local ts_highlight = require('jovim.setup.catppuccin.highlights.treesitter')

local default_overrides = {
	MarkingWindow = { fg = my_palette.text },
	MarkingBorder = { fg = my_palette.blue },

	-- CursorLine = { bg = utils.lighten(my_palette.base, 0.93, my_palette.text) },
	Cursor = { bg = "#f5e0dc" },
	CursorLine = { bg = "#2a2b3c" },
	CursorColumn = { bg = my_palette.mantle },
	LineNr = { fg = my_palette.overlay1 },
	CursorLineNr = { fg = my_palette.blue },
	Visual = { bg = utils.darken(my_palette.surface0, 0.64, my_palette.mantle) },

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

	Pmenu = { bg = my_palette.none },
	PmenuSel = { fg = my_palette.blue, bg = "#2a2b3c" },
	PmenuSbar = { bg = my_palette.none }, -- Popup menu: scrollbar.
	PmenuThumb = { bg = my_palette.blue }, -- Popup menu: Thumb of the scrollbar.

	VertSplit = { fg = my_palette.surface0 },
	NonText = { fg = my_palette.surface0 },
	HlSearchLensNear = { fg = my_palette.sky, bg = mocha.surface0 },
	HlSearchLens = { fg = my_palette.sky, bg = mocha.surface1 },
	GitSignsAdd = { fg = my_palette.diff.add },
	GitSignsChange = { fg = my_palette.diff.change },
	GitSignsDelete = { fg = my_palette.diff.delete },

	TabLineSel = { bg = my_palette.red },

	MiniIndentscopeSymbol = { fg = my_palette.blue },
	IlluminatedWordText = { bg = utils.darken(my_palette.surface0, 0.3, my_palette.mantle) },
	IlluminatedWordRead = { bg = utils.darken(my_palette.surface0, 0.3, my_palette.mantle) },
	IlluminatedWordWrite = { bg = utils.darken(my_palette.surface0, 0.3, my_palette.mantle) },

	MatchParen = { fg = my_palette.blue, bg = utils.darken(my_palette.surface0, 0.3, my_palette.mantle),
		style = { "bold" } },
}

local highlight_overrides = vim.tbl_deep_extend("force",
	default_overrides,
	jotree_highlight,
	cmp_highlight,
	telescope_highlight,
	noice_highlight,
	indent_highlight,
	ts_highlight
)

function M.get_override(type)
	if type == "highlight" then
		return {
			all = highlight_overrides
		}
	end
end

function M.get_mode_color()
	return {
		n = my_palette.blue,
		i = my_palette.green,
		v = my_palette.mauve,
		[''] = my_palette.blue,
		V = my_palette.mauve,
		c = my_palette.mauve,
		no = my_palette.blue,
		s = my_palette.orange,
		S = my_palette.orange,
		[''] = my_palette.orange,
		ic = my_palette.yellow,
		R = my_palette.maroon,
		Rv = my_palette.maroon,
		cv = my_palette.red,
		ce = my_palette.red,
		r = my_palette.cyan,
		rm = my_palette.cyan,
		['r?'] = my_palette.cyan,
		['!'] = my_palette.red,
		t = my_palette.red,
	}
end

return M
