-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  -- Mason: gerenciador de LSP servers
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- Python
        "pyright",
        "ruff",
        -- JavaScript/TypeScript
        "typescript-language-server",
        "prettier",
        -- Lua
        "stylua",
        -- Shell
        "shellcheck",
        "shfmt",
      },
    },
  },

  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    keys = {
      -- Organize Imports (Ruff/Python)
      {
        "<leader>co",
        function()
          vim.lsp.buf.code_action({
            context = { only = { "source.organizeImports" } },
            apply = true,
          })
        end,
        desc = "Organize Imports",
      },
      -- Fix All (Ruff/Python)
      {
        "<leader>cf",
        function()
          vim.lsp.buf.code_action({
            context = { only = { "source.fixAll" } },
            apply = true,
          })
        end,
        desc = "Fix All",
      },
    },
    opts = {
      -- Configuração de diagnósticos
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      },

      -- Inlay hints
      inlay_hints = {
        enabled = true,
      },

      -- Configuração dos servidores
      servers = {
        -- Python: Pyright (type checking + análise)
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                typeCheckingMode = "basic",
                autoImportCompletions = true,
                diagnosticMode = "workspace",
              },
            },
          },
        },

        -- Python: Ruff (linting + formatting)
        ruff = {
          init_options = {
            settings = {
              -- Configurações extras do Ruff podem ir aqui
              organizeImports = true,
              fixAll = true,
            },
          },
        },

        -- Lua
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
              hint = {
                enable = true,
                setType = true,
              },
              telemetry = {
                enable = false,
              },
            },
          },
        },

        -- TypeScript/JavaScript
        tsserver = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
      },

      -- Setup customizado para cada servidor
      setup = {
        -- Pyright: desabilita formatação (Ruff faz isso)
        pyright = function(_, opts)
          require("lspconfig").pyright.setup({
            settings = opts.settings,
            on_attach = function(client, bufnr)
              -- Desabilita formatação do Pyright
              client.server_capabilities.documentFormattingProvider = false
              client.server_capabilities.documentRangeFormattingProvider = false
            end,
          })
          return true
        end,

        -- Ruff: desabilita hover e completion (Pyright faz isso)
        ruff = function(_, opts)
          require("lspconfig").ruff.setup({
            init_options = opts.init_options,
            on_attach = function(client, bufnr)
              -- Desabilita hover do Ruff (conflita com Pyright)
              client.server_capabilities.hoverProvider = false
              -- Desabilita completion do Ruff
              client.server_capabilities.completionProvider = nil
            end,
          })
          return true
        end,
      },
    },
  },
}
