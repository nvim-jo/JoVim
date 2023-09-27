return {
  -- catppuccin
  {
    "catppuccin/nvim",
    lazy = true,
    priority = 1000,
    name = "catppuccin",
    config = function()
      require('jovim.setup.catppuccin').setup()
    end
  },
}
