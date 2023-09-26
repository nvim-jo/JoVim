require("jovim.config").init()

return {
  { "folke/lazy.nvim", version = "*" },
  { "nvim-jo/JoVim", priority = 10000, lazy = false, config = true, cond = true, version = "*" },
}
