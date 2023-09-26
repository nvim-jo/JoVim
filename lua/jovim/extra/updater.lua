local M = {}

M.update_all = function ()
    require("lazy").sync { wait = true }
    require("jovim.extra.utils.mason").update_all()
end

M.setup = function()
    vim.api.nvim_create_user_command("JoVimUpdate", M.update_all, { nargs = 0 })
end

return M