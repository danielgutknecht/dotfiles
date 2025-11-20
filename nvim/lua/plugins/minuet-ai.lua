return {
  "milanglacier/minuet-ai.nvim",
  dependencies = {
    "saghen/blink.cmp",
    "nvim-lua/plenary.nvim",
  },
  event = "InsertEnter",
  opts = {
    --provider = "gemini",
    provider = "codestral",
    codestral = {
      api_key = vim.env.CODESTRAL_API_KEY,
      model = "codestral-latest",
      optional = {
        max_tokens = 512,
        temperature = 0.7,
      },
    },
    virtualtext = {
      enabled = true, -- ATIVADO
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
        accept = "<A-L>", -- aceita palavra
        accept_line = "<A-l>", -- aceita linha inteira
        prev = "<A-[>",
        next = "<A-]>",
        dismiss = "<A-h>",
      },
      hl_group = "Comment",
    },
    notify = "warn",
    request_timeout = 20,
  },
}
