local M = {}

---@param opts? JoVimConfig
function M.setup(opts)
  require("jovim.config").setup(opts)
end

return M
