local M = require("lualine.components.filetype"):extend()

function M:init(options)
    options.ts_icon = options.ts_icon or ""
    if type(options.ts_icon) == "string" then
        options.ts_icon = { options.ts_icon }
    end

    options.ts_icon = vim.tbl_deep_extend("keep", options.ts_icon, {
        color = { fg = "#41942c" },
        align = "right"
    })

    M.super.init(self, options)

    self.ts_icon_hl = self:create_hl(self.options.ts_icon.color, "ts_icon")
end

function M:apply_icon()
   return 
end

return M