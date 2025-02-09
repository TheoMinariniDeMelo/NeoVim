local dapui = require("dapui")
dapui.setup()
vim.keymap.set('n', '<F2>', function() dapui.open() end)
vim.keymap.set('n', '<F3>', function() dapui.close() end)
vim.keymap.set('n', '<F4>', function() dapui.toggle() end)


