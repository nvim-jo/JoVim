local icons = require("jovim.config").icons
local Util = require("jovim.util")
local fancy_mode = require("jovim.setup.lualine.components.fancy_mode")
local fancy_branch = require("jovim.setup.lualine.components.fancy_branch")
local location = require("jovim.setup.lualine.components.location")
local system = require("jovim.setup.lualine.components.system")
local colors = require('jovim.setup.catppuccin.colors').get_palette() 

local M = {}

local function get_os_icon()
    local os = vim.loop.os_uname().sysname
    if os == 'Windows' then
        return ""
    elseif os == 'Linux' then
        local distro = vim.env.WSL_DISTRO_NAME
        if distro == 'Arch' then
            return ""
        elseif distro == "Ubuntu" then
            return ""
        end
        return ""
    elseif os == 'MacOS' then
        return ""
    end
    return ""
end

local os_icon = get_os_icon()

M.get_opts = function()
    local opts = {
        options = {
            theme = "auto",
            globalstatus = true,
            disabled_filetypes = { statusline = { "dashboard", "alpha", "neo-tree" } },
        },
        sections = {
            lualine_a = {
                {
                    fancy_mode,
                    width = 1 ,
                    -- fmt = function(s) return " " .. s end,
                    color = { gui = "bold", fg = colors.bg_dark }
                }
            },
            lualine_b = { fancy_branch },
            lualine_c = {
                {
                    "diagnostics",
                    symbols = {
                        error = icons.diagnostics.Error,
                        warn = icons.diagnostics.Warn,
                        info = icons.diagnostics.Info,
                        hint = icons.diagnostics.Hint,
                    },
                },
                { ' ' },
                {
                    "filename",
                    path = 0,
                    symbols = { modified = "  ", readonly = "", unnamed = "" },
                    separator = ""
                },
            },
            lualine_x = {
                -- stylua: ignore
                {
                    function() return "  " .. require("dap").status() end,
                    cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
                    color = Util.fg("Debug"),
                },
                {
                    require("lazy.status").updates,
                    cond = require("lazy.status").has_updates,
                    color = Util.fg("Special")
                },
                {
                    "diff",
                    symbols = {
                        added = icons.git.added,
                        modified = icons.git.modified,
                        removed = icons.git.removed,
                    },
                },
                {
                    "filetype",
                    colored = false,
                    separator = "",
                    padding = {
                        left = 1,
                        right = 1
                    }
                },
            },
            lualine_y = {
                {
                    system,
                    icon = os_icon,
                }
            },
            lualine_z = {
                {
                    location,
                }
            },
        },
        extensions = { "lazy" },
    }
    return opts
end

return M
