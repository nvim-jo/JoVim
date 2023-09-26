local M = {}

M.update_all = function ()
    require("lazy").sync { wait = true }
    require("jovim.extra.utils.mason").Update()
end

M.setup = function()
    vim.api.nvim_create_user_command("JoVimUpdate", M.update_all, { desc = "Update Mason and Lazy" })
end

return M