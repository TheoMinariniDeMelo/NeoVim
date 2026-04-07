require('mason').setup()
require("plugins.init")
require("keymaps.init")
--require'lspconfig'.pyright.setup{}
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)  -- Use LuaSnip to expand snippets
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),  -- Select previous item
    ['<C-n>'] = cmp.mapping.select_next_item(),  -- Select next item
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),     -- Scroll documentation up
    ['<C-u>'] = cmp.mapping.scroll_docs(4),      -- Scroll documentation down
    ['<C-Space>'] = cmp.mapping.complete(),      -- Trigger completion manually
    ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Confirm completion
  },
  sources = {
    { name = 'nvim_lsp' },        -- LSP source
    { name = 'buffer' },          -- Buffer source
    { name = 'path' },            -- Path source
    { name = 'luasnip' },         -- Snippets source
  },
})


vim.o.tabstop = 4        -- Número de espaços que um tab representa
vim.o.shiftwidth = 4     -- Número de espaços para cada nível de indentação automática
vim.o.softtabstop = 4    -- Número de espaços quando pressionando Tab
vim.o.expandtab = true   -- Converte tabs em espaços
vim.o.smartindent = true -- Identação inteligente para linguagens como C/C++
vim.o.autoindent = true  -- Mantém a indentação da linha anterior

-- Habilita linhas de número e guia de indentação
vim.wo.number = true
vim.opt.list = true
