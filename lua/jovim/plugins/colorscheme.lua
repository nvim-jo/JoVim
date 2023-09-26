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
      local options = require('jovim.setup.catppuccin.colors').get_options()
      return options
    end,
    config = function()
      require('jovim.setup.catppuccin').setup()
    end
  },
}
