local Config = require("jovim.config")
local Float = require("lazy.view.float")
local JoConfig = require("lazy.core.config")
local Plugin = require("lazy.core.plugin")
local Text = require("lazy.view.text")
local Util = require("jovim.util")

---@class JoExtra
---@field name string
---@field enabled boolean
---@field managed boolean
---@field row? number
---@field plugins string[]
---@field optional string[]

---@class jovim.util.extras
local M = {}

M.ns = vim.api.nvim_create_namespace("jovim.extras")
---@type string[]
M.state = nil

---@return JoExtra[]
function M.get()
  M.state = M.state or JoConfig.spec.modules
  local root = JoConfig.plugins.JoVim.dir .. "/lua/jovim/plugins/extras"
  local extras = {} ---@type string[]

  Util.walk(root, function(path, name, type)
    if type == "file" and name:match("%.lua$") then
      local extra = path:sub(#root + 2, -5):gsub("/", ".")
      extras[#extras + 1] = extra
    end
  end)
  table.sort(extras)

  ---@param extra string
  return vim.tbl_map(function(extra)
    local modname = "jovim.plugins.extras." .. extra
    local enabled = vim.tbl_contains(M.state, modname)
    local spec = Plugin.Spec.new({ import = "jovim.plugins.extras." .. extra }, { optional = true })
    local plugins = {} ---@type string[]
    local optional = {} ---@type string[]
    for _, p in pairs(spec.plugins) do
      if p.optional then
        optional[#optional + 1] = p.name
      else
        plugins[#plugins + 1] = p.name
      end
    end
    table.sort(plugins)
    table.sort(optional)

    return {
      name = extra,
      enabled = enabled,
      managed = vim.tbl_contains(Config.json.data.extras, extra) or not enabled,
      plugins = plugins,
      optional = optional,
    }
  end, extras)
end

---@class JoExtraView
---@field float JoFloat
---@field text Text
---@field extras JoExtra[]
---@field diag JoDiagnostic[]
local X = {}

---@return JoExtraView
function X.new()
  local self = setmetatable({}, { __index = X })
  self.float = Float.new({ title = "JoVim Extras" })
  self.float:on_key("x", function()
    self:toggle()
  end, "Toggle extra")
  self.diag = {}
  self:update()
  return self
end

---@param diag JoDiagnostic
function X:diagnostic(diag)
  diag.row = diag.row or self.text:row()
  diag.severity = diag.severity or vim.diagnostic.severity.INFO
  table.insert(self.diag, diag)
end

function X:toggle()
  local pos = vim.api.nvim_win_get_cursor(self.float.win)
  for _, extra in ipairs(self.extras) do
    if extra.row == pos[1] then
      if not extra.managed then
        Util.error(
          "Not managed by JoExtras. Remove from your config to enable/disable here.",
          { title = "JoExtras" }
        )
        return
      end
      extra.enabled = not extra.enabled
      Config.json.data.extras = vim.tbl_filter(function(name)
        return name ~= extra.name
      end, Config.json.data.extras)
      M.state = vim.tbl_filter(function(name)
        return name ~= "jovim.plugins.extras." .. extra.name
      end, M.state)
      if extra.enabled then
        table.insert(Config.json.data.extras, extra.name)
        M.state[#M.state + 1] = "jovim.plugins.extras." .. extra.name
      end
      table.sort(Config.json.data.extras)
      Config.json.save()
      Util.info(
        "`"
          .. extra.name
          .. "`"
          .. " "
          .. (extra.enabled and "**enabled**" or "**disabled**")
          .. "\nPlease restart JoVim to apply the changes.",
        { title = "JoExtras" }
      )
      self:update()
      return
    end
  end
end

function X:update()
  self.diag = {}
  self.extras = M.get()
  self.text = Text.new()
  self.text.padding = 2
  self:render()
  self.text:trim()
  vim.bo[self.float.buf].modifiable = true
  self.text:render(self.float.buf)
  vim.bo[self.float.buf].modifiable = false
  vim.diagnostic.set(
    M.ns,
    self.float.buf,
    ---@param diag JoDiagnostic
    vim.tbl_map(function(diag)
      diag.col = 0
      diag.lnum = diag.row - 1
      return diag
    end, self.diag),
    { signs = false, virtual_text = true }
  )
end

function X:render()
  self.text:nl():nl():append("JoVim Extras", "JoH1"):nl():nl()
  self.text
    :append("This is a list of all enabled/disabled JoVim extras.", "JoComment")
    :nl()
    :append("Each extra shows the required and optional plugins it may install.", "JoComment")
    :nl()
    :append("Enable/disable extras with the ", "JoComment")
    :append("<x>", "JoSpecial")
    :append(" key", "JoComment")
    :nl()
  self:section({ enabled = true, title = "Enabled" })
  self:section({ enabled = false, title = "Disabled" })
end

---@param extra JoExtra
function X:extra(extra)
  if not extra.managed then
    self:diagnostic({
      message = "Not managed by JoExtras (config)",
      severity = vim.diagnostic.severity.WARN,
    })
  end
  extra.row = self.text:row()
  local hl = extra.managed and "JoSpecial" or "JoLocal"
  if extra.enabled then
    self.text:append("  " .. JoConfig.options.ui.icons.loaded .. " ", hl)
  else
    self.text:append("  " .. JoConfig.options.ui.icons.not_loaded .. " ", hl)
  end
  self.text:append(extra.name)
  for _, plugin in ipairs(extra.plugins) do
    self.text:append(" "):append(JoConfig.options.ui.icons.plugin .. "" .. plugin, "JoReasonPlugin")
  end
  for _, plugin in ipairs(extra.optional) do
    self.text:append(" "):append(JoConfig.options.ui.icons.plugin .. "" .. plugin, "JoReasonRequire")
  end
  self.text:nl()
end

---@param opts {enabled?:boolean, title?:string}
function X:section(opts)
  opts = opts or {}
  ---@type JoExtra[]
  local extras = vim.tbl_filter(function(extra)
    return opts.enabled == nil or extra.enabled == opts.enabled
  end, self.extras)

  self.text:nl():append(opts.title .. ":", "JoH2"):append(" (" .. #extras .. ")", "JoComment"):nl()
  for _, extra in ipairs(extras) do
    self:extra(extra)
  end
end

function M.show()
  return X.new()
end

return M