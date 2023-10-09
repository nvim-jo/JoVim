local C = require('jovim.setup.catppuccin.utils').palette
local utils = require('catppuccin.utils.colors')

return {
    -- For indent-blankline
    IndentBlanklineChar = { fg = C.surface0, style = {} },
    IndentBlanklineContextChar = { fg = C.lavender, style = { "bold" } },
    IndentBlanklineContextStart = { sp = C.lavender, style = { "underline" } },
}
