local utils = require('catppuccin.utils.colors')

local highlight = {
    "RainbowBlue",
    "RainbowMauve",
    "RainbowLavender",
    "RainbowRed",
    "RainbowGreen",
    "RainbowYellow",
    "RainbowRosewater",
}

local indent_highliht = {
    "RainbowDark"
}

local hooks = require "ibl.hooks"

local M = {}
M.setup = function ()
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#89B4FA" })
        vim.api.nvim_set_hl(0, "RainbowMauve", { fg = "#CBA6F7" })
        vim.api.nvim_set_hl(0, "RainbowLavender", { fg = "#B4BEFE" })
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#F38BA8" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#A6E3A1" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#F9E2AF" })
        vim.api.nvim_set_hl(0, "RainbowRosewater", { fg = "#F5E0DC" })
        vim.api.nvim_set_hl(0, "RainbowDark", { fg = utils.darken("#313244", 0.9, "#1E1E2E" ) })
    end)

    
    vim.g.rainbow_delimiters = { highlight = highlight }
    require("ibl").setup {
        exclude = {
            filetypes = {
                "help",
                "alpha",
                "dashboard",
                "jo-tree",
                "Trouble",
                "lazy",
                "mason",
                "notify",
                "toggleterm",
                "lazyterm",
            }
        }, 
        scope = {
            highlight = highlight,
            show_end = false,
            show_start = false,
            exclude = {
                language = {},
                node_type = {
                    ["*"] = {
                        "source_file",
                        "program",
                    },
                    lua = {
                        "chunk",
                    },
                    python = {
                        "module",
                    },
                },
            },
        },
        indent = {
            char = "│",
            tab_char = "│",
            -- tab_char = nil,
            highlight = indent_highliht,
            smart_indent_cap = true,
            priority = 1,
        },
        viewport_buffer = {
            min = 30,
            max = 500,
        },
    }

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
end

return M