local M = require('lualine.component'):extend()

function M:init(options)
    M.super.init(self, options)
end

function M:update_status()
    local os = vim.loop.os_uname().sysname
    if os == "Linux" then
        local distro = vim.env.WSL_DISTRO_NAME
        return distro
    end
    return os
end

return M