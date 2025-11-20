-- ~/.config/nvim/lua/plugins/conform.lua
return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>cF",
        function()
          require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
        end,
        mode = { "n", "v" },
        desc = "Format Injected Langs",
      },
    },
    opts = {
      -- Formatadores por tipo de arquivo
      formatters_by_ft = {
        -- Python: apenas Ruff (rápido e compatível com Black)
        python = { "ruff_organize_imports", "ruff_format" },

        -- Lua
        lua = { "stylua" },

        -- Shell
        sh = { "shfmt" },
        bash = { "shfmt" },

        -- JavaScript/TypeScript
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },

        -- Web
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },

        -- Config files
        toml = { "taplo" },
      },

      -- Formatar ao salvar
      format_on_save = function(bufnr)
        -- Desabilita formatação para arquivos muito grandes
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        local filesize = vim.fn.getfsize(bufname)
        if filesize > 100 * 1024 then -- 100KB
          return
        end

        return {
          timeout_ms = 2000,
          lsp_fallback = true,
        }
      end,

      -- Formatadores alternativo quando o principal falha
      format_after_save = {
        lsp_fallback = true,
      },

      -- Configuração customizada de formatadores
      formatters = {
        -- Shell: 2 espaços de indentação
        shfmt = {
          prepend_args = { "-i", "2", "-ci" }, -- -ci = indent switch cases
        },

        -- Prettier: configuração consistente
        prettier = {
          prepend_args = {
            "--print-width",
            "100",
            "--single-quote",
            "--trailing-comma",
            "es5",
            "--tab-width",
            "2",
          },
        },

        -- Ruff Format: compatível com Black
        ruff_format = {
          prepend_args = {
            "--line-length",
            "100",
          },
        },

        -- Ruff Organize Imports
        ruff_organize_imports = {
          command = "ruff",
          args = {
            "check",
            "--select",
            "I",
            "--fix",
            "--exit-zero",
            "--stdin-filename",
            "$FILENAME",
            "-",
          },
        },

        -- Stylua: configuração para Lua
        stylua = {
          prepend_args = {
            "--indent-type",
            "Spaces",
            "--indent-width",
            "2",
            "--column-width",
            "100",
          },
        },
      },

      -- Notificações de formato
      notify_on_error = true,
      notify_no_formatters = false,
    },
  },
}
