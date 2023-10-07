local M = {}
local catppuccin = require("catppuccin")
local mocha = require("catppuccin.palettes").get_palette("mocha")
local utils = require('catppuccin.utils.colors')

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

local my_palette = vim.tbl_deep_extend("force", mocha, mocha_overrides, {
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

function M.get_palette()
	return my_palette
end

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
	LspInfoBorder = { link = "FloatBorder" },

	-- For indent-blankline
	IndentBlanklineChar = { fg = utils.darken(my_palette.surface0, 0.40, my_palette.mantle), style = {} },
	IndentBlanklineContextChar = { fg = my_palette.lavender, style = { "bold" } },
	IndentBlanklineContextStart = { sp = my_palette.lavender, style = { "underline" } },

	-- For nvim-cmp and wilder.nvim
	CmpItemAbbrMatch = { fg = my_palette.blue },
	CmpItemAbbrMatchFuzzy = { fg = my_palette.blue },
	CmpDoc = { link = "NormalFloat" },
	CmpDocBorder = {
		fg = my_palette.blue,
		bg = my_palette.none,
	},
	CmpBorder = {
		fg = my_palette.blue,
		bg = my_palette.none,
	},
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

local highlight_overrides = vim.tbl_deep_extend("force", default_overrides, jotree_highlight)

M.overrides = {
	colors = {
		all = mocha_overrides,
	},
	highlights = {
		all = highlight_overrides
	},
}

function M.get_options()
	return
	{
		flavor = "mocha",
		transparent_background = false,
		no_italic = true,
		term_colors = true,
		compile = {
			enabled = false,
			path = vim.fn.stdpath("cache") .. "/catppuccin",
		},
		dim_inactive = {
			enabled = false,
			shade = "dark",
			percentage = 0.15,
		},
		styles = {
			comments = { "italic" },
			conditionals = { "bold" },
			loops = { "bold" },
			functions = { "italic, bold" },
			keywords = { "italic" },
			strings = {},
			variables = {},
			numbers = {},
			booleans = { "bold", "italic" },
			properties = { "italic" },
			types = {},
			operators = { "bold" },
		},
		integrations = {
			treesitter = true,
			treesitter_context = true,
			ts_rainbow = true,
			cmp = true,
			gitgutter = true,
			gitsigns = true,
			lsp_trouble = true,
			neogit = true,
			symbols_outline = true,
			telescope = false,
			neotest = true,
			nvimtree = false,
			dashboard = false,
			markdown = true,
			mason = true,
			notify = true,
			noice = true,
			-- harpoon = true,
			which_key = true,
			semantic_tokens = true,
			navic = {
				enabled = true,
				custom_bg = "NONE",
			},
			indent_blankline = {
				enabled = true,
				colored_indent_levels = true,
			},
			dap = {
				enabled = true,
				enabled_ui = true,
			},
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
				},
				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
				},
			},
			barbecue = {
				dim_dirname = true, -- directory name is dimmed by default
				bold_basename = true,
				dim_context = false,
				alt_background = false,
			},
		},
		color_overrides = M.overrides.colors,
		highlight_overrides = M.overrides.highlights,
	}
end

return M
