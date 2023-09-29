local highlight = {
    "RainbowBlue",
    "RainbowMauve",
    "RainbowLavender",
    "RainbowRed",
    "RainbowGreen",
    "RainbowYellow",
    "RainbowRosewater",
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
    end)

    
    vim.g.rainbow_delimiters = { highlight = highlight }
    require("ibl").setup { 
        scope = { highlight = highlight },
        char = "│",
        filetype_exclude = {
            "help",
            "alpha",
            "dashboard",
            "neo-tree",
            "Trouble",
            "lazy",
            "mason",
            "notify",
            "toggleterm",
            "lazyterm",
        },
    }

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
end

return M