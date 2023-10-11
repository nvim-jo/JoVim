local lualine = require('lualine')
local fancy_branch = require('jovim.setup.lualine.components.fancy_branch')
local fancy_location = require('jovim.setup.lualine.components.fancy_location')
local fancy_filetype = require('jovim.setup.lualine.components.fancy_filetype')

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#181825',
  fg       = '#CDD6F4',
  yellow   = '#f9e2af',
  cyan     = '#89dceb',
  darkblue = '#081633',
  green    = '#a6e3a1',
  orange   = '#fab387',
  maroon = '#eba0ac',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#89B4FA',
  red      = '#f38ba8',
  lavender = '#b4befe',
  mauve = '#cba6f7',
  text = "#cdd6f4",
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
  check_if_python = function ()
    return vim.bo.filetype == "python"
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
    disabled_filetypes = { statusline = { "dashboard", "alpha", "jo-tree" } },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

local function capitalizeFirstLetter(str)
  -- Check if the string is not empty
  if #str > 0 then
      -- Capitalize the first letter and make the rest lowercase
      return str:sub(1, 1):upper() .. str:sub(2):lower()
  else
      return str
  end
end

ins_left {
  function()
    return '▊'
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = require('jovim.setup.catppuccin.colors').get_mode_color() 
    return { fg = mode_color[vim.fn.mode()] }
  end, 
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
  fancy_branch 
}

ins_left {
  'filetype',
  icon_only = true,
  separator = "",
  padding = {right = 0, left=1 }
}

ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
  color = { fg = colors.text, gui = 'bold' },
}

-- ins_left {
--   function ()
--     return "Select Venv"
--   end,
--   cond = conditions.check_if_python,
--   color = { fg = colors.text },
--   on_click = function()
--     require('selectvenv').open()
--   end,
-- }

ins_left {
  'venv-selector',
  icon = "",
  cond = conditions.check_if_python,
  color = { fg = "#CDD6F4" },
}

ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}

ins_left {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = ' ', modified = ' ', removed = ' ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}

ins_right {
  fancy_location
}

ins_right {
  fancy_filetype,
  fmt = capitalizeFirstLetter,
  padding = { left = 1, right = 1 }
}

local M = {}
M.setup = function ()
    vim.o.laststatus = vim.g.lualine_laststatus
    lualine.setup(config)
end

return M