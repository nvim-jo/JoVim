local M = require("lualine.components.branch"):extend()

function M:init(options)
    options.icon = options.icon or { "", color = { fg = "#a6e3a1"} }-- color = { fg = "#fc5603" } }
    M.super.init(self, options)
end

return M