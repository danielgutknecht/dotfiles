-- ~/.config/nvim/lua/plugins/minuet.lua
return {
  -- Minuet AI
  {
    "milanglacier/minuet-ai.nvim",
    dependencies = {
      "saghen/blink.cmp",
      "nvim-lua/plenary.nvim",
    },
    event = "InsertEnter",
    opts = {
      provider = "codestral",
      codestral = {
        api_key = vim.env.CODESTRAL_API_KEY, -- configure: export CODESTRAL_API_KEY="sua-chave"
        model = "codestral-latest",
        optional = {
          max_tokens = 512,
        },
      },
      virtualtext = {
        auto_trigger_ft = {
          "lua",
          "python",
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "rust",
          "go",
          "html",
          "css",
          "json",
          "yaml",
          "yml",
          "toml",
          "markdown",
        },
        min_prefix_length = 2,
        debounce_ms = 300,
        max_tokens = 512,
        keymap = {
          accept = "<A-L>",
          accept_line = "<A-l>",
          prev = "<A-[>",
          next = "<A-]>",
          dismiss = "<A-h>",
        },
      },
      notify = "warn",
      request_timeout = 20,
    },
  },

  -- Blink.cmp - CONFIGURAÇÃO CORRIGIDA
  {
    "saghen/blink.cmp",
    version = "*",
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    opts = {
      keymap = {
        preset = "default",
        ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },

      completion = {
        accept = {
          auto_brackets = {
            enabled = true,
          },
        },
        menu = {
          enabled = true,
          auto_show = true,
          draw = {
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
              { "kind" },
              { "source_name" }, -- mostra de onde vem a sugestão
            },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = {
            border = "rounded",
          },
        },
        list = {
          selection = {
            preselect = true,
            auto_insert = true,
          },
        },
      },

      -- FONTES DE COMPLETAÇÃO - ORDEM IMPORTA!
      sources = {
        -- IMPORTANTE: LSP deve estar primeiro
        default = { "lsp", "path", "snippets", "buffer", "minuet" },

        providers = {
          -- LSP (mais importante)
          lsp = {
            name = "LSP",
            module = "blink.cmp.sources.lsp",
            score_offset = 100, -- PRIORIDADE MÁXIMA
            enabled = true,
          },

          -- Path completions
          path = {
            name = "Path",
            module = "blink.cmp.sources.path",
            score_offset = 10,
            opts = {
              trailing_slash = false,
              label_trailing_slash = true,
            },
          },

          -- Snippets
          snippets = {
            name = "Snippets",
            module = "blink.cmp.sources.snippets",
            score_offset = 50,
          },

          -- Buffer words
          buffer = {
            name = "Buffer",
            module = "blink.cmp.sources.buffer",
            score_offset = 5,
            opts = {
              max_items = 5, -- limita sugestões do buffer
            },
          },

          -- Minuet AI (menor prioridade que LSP)
          minuet = {
            name = "Minuet",
            module = "minuet.blink",
            score_offset = 80, -- menos que LSP
            enabled = true,
          },
        },

        -- Por filetype (Python prioriza LSP)
        per_filetype = {
          python = { "lsp", "snippets", "buffer", "minuet" },
          lua = { "lsp", "snippets", "buffer" },
          markdown = { "buffer", "snippets" },
        },
      },

      signature = {
        enabled = true,
        window = {
          border = "rounded",
        },
      },
    },
  },
}
