local M = {}
local vim = vim

local colors = require("jovim.setup.catppuccin.colors").get_palette()

function M.get_colors()
  return colors
end

M.theme_colors = colors

M.mode_color = {
  --n = 'DarkGoldenrod2',
  n = colors.green,
  i = colors.blue,
  v = 'gray',
  [""] = 'gray',
  V = 'gray',
  c = 'plum3',
  no = 'DarkGoldenrod2',
  s = 'SkyBlue2',
  S = 'SkyBlue2',
  [""] = 'SkyBlue2',
  ic = 'chartreuse3',
  R = 'purple',
  Rv = 'purple',
  cv = 'plum3',
  ce = 'plum3',
  r = 'chocolate',
  rm = 'chocolate',
  ["r?"] = 'chocolate',
  ["!"] = 'plum3',
  t = 'plum3'
}

M.setup = function()
  vim.api.nvim_command [[syntax on]]
  local opts = require('jovim.setup.catppuccin.colors').get_options()
  require('catppuccin').setup(opts)
  vim.g.catppuccin_flavour = "mocha"  -- latte, frappe, macchiato mocha
end

return M