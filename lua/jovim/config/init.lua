local Util = require("jovim.util")

---@class JoVimConfig: JoVimOptions
local M = {}

M.version = "10.0.0"

---@class JoVimOptions
local defaults = {
  -- colorscheme can be a string like `catppuccin` or a function that will load the colorscheme
  ---@type string|fun()
  colorscheme = "catppuccin",
  -- load the default settings
  defaults = {
    autocmds = true, -- jovim.config.autocmds
    keymaps = true, -- jovim.config.keymaps
    -- jovim.config.options can't be configured here since that's loaded before jovim setup
    -- if you want to disable loading options, add `package.loaded["jovim.config.options"] = true` to the top of your init.lua
  },
  -- icons used by other plugins
  icons = require('jovim.icons').icons,
  ---@type table<string, string[]>?
  kind_filter = {
    default = {
      "Class",
      "Constructor",
      "Enum",
      "Field",
      "Function",
      "Interface",
      "Method",
      "Module",
      "Namespace",
      "Package",
      "Property",
      "Struct",
      "Trait",
    },
    -- you can specify a different filter for each filetype
    lua = {
      "Class",
      "Constructor",
      "Enum",
      "Field",
      "Function",
      "Interface",
      "Method",
      "Module",
      "Namespace",
      -- "Package", -- remove package since luals uses it for control flow structures
      "Property",
      "Struct",
      "Trait",
    },
  }, 
}

M.json = {
  data = {
    version = nil, ---@type string?
    extras = {}, ---@type string[]
  },
}

function M.json.load()
  local path = vim.fn.stdpath("config") .. "/jovim.json"
  local f = io.open(path, "r")
  if f then
    local data = f:read("*a")
    f:close()
    local ok, json = pcall(vim.json.decode, data, { luanil = { object = true, array = true } })
    if ok then
      M.json.data = vim.tbl_deep_extend("force", M.json.data, json or {})
    end
  end
end

function M.json.save()
  local path = vim.fn.stdpath("config") .. "/jovim.json"
  local f = io.open(path, "w")
  if f then
    f:write(vim.json.encode(M.json.data))
    f:close()
  end
end

---@type JoVimOptions
local options

---@param opts? JoVimOptions
function M.setup(opts)
  options = vim.tbl_deep_extend("force", defaults, opts or {}) or {}

  -- autocmds can be loaded lazily when not opening a file
  local lazy_autocmds = vim.fn.argc(-1) == 0
  if not lazy_autocmds then
    M.load("autocmds")
  end

  local group = vim.api.nvim_create_augroup("LazyVim", { clear = true })
  vim.api.nvim_create_autocmd("User", {
    group = group,
    pattern = "VeryLazy",
    callback = function()
      if lazy_autocmds then
        M.load("autocmds")
      end
      M.load("keymaps")
      require("jovim.extra.notepad").setup()
      require("jovim.extra.updater").setup()


      Util.format.setup()

      vim.api.nvim_create_user_command("JoRoot", function()
        Util.root.info()
      end, { desc = "JoVim roots for the current buffer" })

      vim.api.nvim_create_user_command("JoExtras", function()
        Util.extras.show()
      end, { desc = "Manage JoVim extras" })
    end,
  })

  Util.track("colorscheme")
  Util.try(function()
    if type(M.colorscheme) == "function" then
      M.colorscheme()
    else
      vim.cmd.colorscheme(M.colorscheme)
    end
  end, {
    msg = "Could not load your colorscheme",
    on_error = function(msg)
      Util.error(msg)
      vim.cmd.colorscheme("habamax")
    end,
  })
  Util.track()
end

---@param buf? number
---@return string[]?
function M.get_kind_filter(buf)
  buf = (buf == nil or buf == 0) and vim.api.nvim_get_current_buf() or buf
  local ft = vim.bo[buf].filetype
  if M.kind_filter == false then
    return
  end
  return M.kind_filter[ft] or M.kind_filter.default
end

---@param name "autocmds" | "options" | "keymaps"
function M.load(name)
  local function _load(mod)
    if require("lazy.core.cache").find(mod)[1] then
      Util.try(function()
        require(mod)
      end, { msg = "Failed loading " .. mod })
    end
  end
  -- always load jovim, then user file
  if M.defaults[name] or name == "options" then
    _load("jovim.config." .. name)
  end
  _load("config." .. name)
  if vim.bo.filetype == "lazy" then
    -- HACK: LazyVim may have overwritten options of the Lazy ui, so reset this here
    vim.cmd([[do VimResized]])
  end
  local pattern = "JoVim" .. name:sub(1, 1):upper() .. name:sub(2)
  vim.api.nvim_exec_autocmds("User", { pattern = pattern, modeline = false })
end

M.did_init = false
function M.init()
  if M.did_init then
    return
  end
  M.did_init = true
  local plugin = require("lazy.core.config").spec.plugins.LazyVim
  if plugin then
    vim.opt.rtp:append(plugin.dir)
  end

  package.preload["jovim.plugins.lsp.format"] = function()
    Util.deprecate([[require("jovim.plugins.lsp.format")]], [[require("jovim.util").format]])
    return Util.format
  end

  -- delay notifications till vim.notify was replaced or after 500ms
  require("jovim.util").lazy_notify()

  -- load options here, before lazy init while sourcing plugin modules
  -- this is needed to make sure options will be correctly applied
  -- after installing missing plugins
  M.load("options")

  Util.plugin.setup()
  M.json.load()
end

setmetatable(M, {
  __index = function(_, key)
    if options == nil then
      return vim.deepcopy(defaults)[key]
    end
    ---@cast options JoVimConfig
    return options[key]
  end,
})

return M