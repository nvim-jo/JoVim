local M = {}

function M.event(event, delay)
    local emit_event = function() vim.api.nvim_exec_autocmds("User", { pattern = "JoVim" .. event, modeline = false }) end
    if delay == false then
      emit_event()
    else
      vim.schedule(emit_event)
    end
  end

function M.notify(msg, type, opts)
    vim.schedule(function() vim.notify(msg, type, M.extend_tbl({ title = "JoVim" }, opts)) end)
end

return M