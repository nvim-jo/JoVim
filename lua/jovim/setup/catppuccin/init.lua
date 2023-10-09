local M = {}
local vim = vim

local colors = require("jovim.setup.catppuccin.utils").palette
local override = require('jovim.setup.catppuccin.colors').get_override

M.theme_colors = colors

function M.get_options()
	return
	{
		flavor = "mocha",
		transparent_background = false,
		no_italic = true,
		no_bold = true,
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
			gitgutter = true,
			gitsigns = true,
			lsp_trouble = true,
			neogit = true,
			symbols_outline = true,
			neotest = true,
			nvimtree = false,
			dashboard = false,
			markdown = true,
			mason = true,
			notify = true,
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
		highlight_overrides = override('highlight') 
	}
end

M.setup = function()
	vim.api.nvim_command [[syntax on]]
	local opts = M.get_options()
	require('catppuccin').setup(opts)
	vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato mocha
end

return M
