-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.updatetime = 300
vim.opt.signcolumn = "yes" -- sempre mostra gutter
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.ignorecase = true -- Ignora case na busca
vim.opt.smartcase = true -- Case-sensitive se usar maiúsculas
-- ========== INDENTAÇÃO ==========
vim.opt.expandtab = true -- Usa espaços ao invés de tabs
vim.opt.shiftwidth = 4 -- Tamanho da indentação
vim.opt.tabstop = 4 -- Tamanho do tab
vim.opt.softtabstop = 4 -- Comportamento consistente do backspace
vim.opt.smartindent = true -- Indentação inteligente
vim.opt.breakindent = true -- Mantém indentação em linhas quebradas
vim.opt.shiftround = true -- Arredonda indentação para múltiplos de shiftwidth
-- ========== BUSCA ==========
vim.opt.ignorecase = true -- Ignora case na busca
vim.opt.smartcase = true -- Case-sensitive se usar maiúsculas
vim.opt.hlsearch = true -- Destaca resultados da busca
vim.opt.incsearch = true -- Busca incremental
-- ========== INTERFACE ==========
vim.opt.termguicolors = true -- Cores 24-bit
vim.opt.cursorline = true -- Destaca linha atual
vim.opt.scrolloff = 8 -- Mantém 8 linhas ao rolar
vim.opt.sidescrolloff = 8 -- Mantém 8 colunas ao rolar
vim.opt.wrap = false -- Não quebra linhas longas
vim.opt.linebreak = true -- Quebra em palavras completas (se wrap = true)
vim.opt.showmode = false -- Não mostra modo (já está na statusline)
vim.opt.conceallevel = 2 -- Esconde markdown syntax (0 para desabilitar)
-- ========== SPLITS ==========
vim.opt.splitright = true -- Novo split vertical à direita
vim.opt.splitbelow = true -- Novo split horizontal abaixo
-- ========== CLIPBOARD ==========
vim.opt.clipboard = "unnamedplus" -- Usa clipboard do sistema
-- ========== BACKUP & UNDO ==========
vim.opt.swapfile = false -- Desabilita arquivos .swp
vim.opt.backup = false -- Desabilita backups
vim.opt.undofile = true -- Habilita undo persistente
vim.opt.undolevels = 10000 -- Mais níveis de undo
-- ========== COMPORTAMENTO ==========
vim.opt.mouse = "a" -- Habilita mouse em todos os modos
vim.opt.confirm = true -- Confirma ao sair sem salvar
vim.opt.virtualedit = "block" -- Permite cursor em posições vazias no Visual Block
vim.opt.inccommand = "split" -- Preview de substituição em SPLITS
-- ========== AUTOCOMPLETAR ==========
vim.opt.completeopt = "menu,menuone,noselect" -- Melhor experiência de completar
vim.opt.pumheight = 10 -- Altura máxima do popup menu
-- ========== WILDMENU ==========
vim.opt.wildmode = "longest:full,full" -- Modo de completar no comando
vim.opt.wildignore:append({ "*.pyc", "*.o", "*.class", "*.DS_Store" }) -- Ignora arquivos

-- ========== PERFORMANCE ==========
-- Performance
--vim.opt.lazyredraw = true -- Não redesenha durante macros
--vim.opt.timeoutlen = 400 -- Tempo para key combos (ms)

vim.fn.sign_define("DiagnosticSignError", { text = "✘", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "▲", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "⚑", texthl = "DiagnosticSignHint" })
