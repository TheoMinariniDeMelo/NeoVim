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
