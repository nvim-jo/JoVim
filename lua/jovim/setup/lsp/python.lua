local M = {}

function M.get_config()
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    return {
        servers = {
            pyright = {
                capabilities = capabilities,
                settings = {
                    python = {
                        analysis = {
                            useLibraryCodeForTypes = true,
                            diagnosticSeverityOverrides = {
                                reportUnusedVariable = "warning"
                            },
                            -- diagnosticMode = 'basic',
                            typeCheckingMode = "off",
                        }
                    }
                }
            },
            ruff_lsp = {
                settings = {
                    organizeImports = false,
                },
                on_attach = function(client) client.server_capabilities.hoverProvider = false end,
            }
        }
    }
end

return M