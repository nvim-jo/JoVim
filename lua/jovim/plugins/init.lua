if vim.fn.has("nvim-0.9.0") == 0 then
  vim.api.nvim_echo({
    { "JoVim requires Neovim >= 0.9.0\n", "ErrorMsg" },
    { "Press any key to exit", "MoreMsg" },
  }, true, {})
  vim.fn.getchar()
  vim.cmd([[quit]])
  return {}
end

require("jovim.config").init()

return {
  { "folke/lazy.nvim", version = "*" },
  { "nvim-jo/JoVim", priority = 10000, lazy = false, config = true, cond = true, version = "*" },
}