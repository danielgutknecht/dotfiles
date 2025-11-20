return {
  "GeorgesAlkhouri/nvim-aider",
  cmd = "Aider", -- Lazy-load no comando Aider
  keys = {
    { "<leader>a/", "<cmd>Aider toggle<cr>", desc = "Toggle Aider" },
    { "<leader>as", "<cmd>Aider send<cr>", desc = "Send to Aider", mode = { "n", "v" } },
    { "<leader>ac", "<cmd>Aider command<cr>", desc = "Aider Commands" },
    { "<leader>ab", "<cmd>Aider buffer<cr>", desc = "Send Buffer" },
    { "<leader>a+", "<cmd>Aider add<cr>", desc = "Add File" },
    { "<leader>a-", "<cmd>Aider drop<cr>", desc = "Drop File" },
    { "<leader>ar", "<cmd>Aider add readonly<cr>", desc = "Add Read-Only" },
    { "<leader>aR", "<cmd>Aider reset<cr>", desc = "Reset Session" },
  },
  -- Configurações opcionais
  opts = {
    -- Modelo de IA padrão (ex: "gpt-4o")
    model = nil,
    -- Janela do terminal (split, vsplit, etc.)
    terminal = { position = "botright", size = 15 },
    -- Outras opções: ver docs no GitHub
  },
}
