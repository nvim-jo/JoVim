return {

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },

  -- catppuccin
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = function ()
      local options = require('setup.catppuccin.colors').get_options()
      return options
    end,
    config = function()
      require('setup.catppuccin').setup()
    end
  },
}
