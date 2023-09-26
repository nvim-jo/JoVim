local M = require("lualine.component"):extend()

function M:init(options)
    M.super.init(self, options)
end

function M:update_status()
    local line = vim.fn.line(".")
    local col = vim.fn.virtcol(".")
    return string.format('Ln %d, Col %d', line, col)
end

return M