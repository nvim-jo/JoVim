local M = {}

M.Update = function()
    local _ = require "mason-core.functional"
    local platform = require "mason-core.platform"
    local notify = require "mason-core.notify"
    local registry = require "mason-registry"
    notify "Updating registries…"

    local function handle_result(success, updated_registries)
        if success then
            local count = #updated_registries
            notify(("Successfully updated %d %s."):format(count, count == 1 and "registry" or "registries"))
        else
            notify(("Failed to update registries: %s"):format(updated_registries), vim.log.levels.ERROR)
        end
    end

    if platform.is_headless then
        local a = require "mason-core.async"
        a.run_blocking(function()
            local success, updated_registries = a.wait(registry.update)
            a.scheduler()
            handle_result(success, updated_registries)
        end)
    else
        registry.update(_.scheduler_wrap(handle_result))
    end
end

return M