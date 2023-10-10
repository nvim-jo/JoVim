local capabilities = require("cmp_nvim_lsp").default_capabilities()
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "ninja", "python", "rst", "toml" })
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
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
    end,
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     servers = {
  --       pyright = {
  --         capabilities = capabilities,
  --         settings = {
  --           python = {
  --             analysis = {
  --               useLibraryCodeForTypes = true,
  --               diagnosticSeverityOverrides = {
  --                 reportUnusedVariable = "warning"
  --               },
  --               -- diagnosticMode = 'basic',
  --               typeCheckingMode = "off",
  --             }
  --           }
  --         }
  --       },
  --       ruff_lsp = {},
  --     },
  --     setup = {
  --       ruff_lsp = function()
  --         require("jovim.util").on_attach(function(client, _)
  --           if client.name == "ruff_lsp" then
  --             -- Disable hover in favor of Pyright
  --             client.server_capabilities.hoverProvider = false
  --           end
  --         end)
  --       end,
  --     },
  --   },
  -- },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "nvim-neotest/neotest-python",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {
          -- Here you can specify the settings for the adapter, i.e.
          -- runner = "pytest",
          -- python = ".venv/bin/python",
        },
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      "mfussenegger/nvim-dap-python",
      -- stylua: ignore
      keys = {
        { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method" },
        { "<leader>dPc", function() require('dap-python').test_class() end,  desc = "Debug Class" },
      },
      config = function()
        local path = require("mason-registry").get_package("debugpy"):get_install_path()
        require("dap-python").setup(path .. "/venv/bin/python")
      end,
    },
  },
  {
    "nvim-jo/selenv.nvim",
    keys = {
      { "<leader>cv", function() require('selenv.api').pick_venv() end, desc = "Select VirtualEnv" },
    }
  },
}
