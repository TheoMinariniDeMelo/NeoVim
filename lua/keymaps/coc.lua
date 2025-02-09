vim.api.nvim_set_keymap('n', '<C-]>', ':call CocActionAsync("definition")<CR>', { noremap = true, silent = true }) -- Configurar o coc.nvim 
vim.g.coc_global_extensions = {'coc-python'}
