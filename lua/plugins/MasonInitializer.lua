require('mason-lspconfig').setup({
	ensure_installed = { "gopls","pyright", "lua_ls", "clangd", "jdtls", "csharp_ls", "eslint"},
	automatic_installation = true,
})
-- Configuração de cada servidor LSP
require('lspconfig').pyright.setup({
	on_attach = function(client, bufnr)
		-- Enable completion for LSP servers
		require'cmp'.setup.buffer({
			sources = {
				{ name = 'nvim_lsp' },
			}
		})
	end
})
vim.lsp.enable('csharp_ls')
vim.lsp.enable('eslint')
--vim.lsp.config('eslint')
local lspconfig = require('lspconfig')

lspconfig.tsserver.setup({
  on_attach = function(client, bufnr)
    -- Atalhos, formatação, etc.
    print("LSP para JavaScript/TypeScript conectado!")
  end
})

lspconfig.eslint.setup({})
lspconfig.clangd.setup({})
lspconfig.lua_ls.setup({ -- Nome correto do servidor LSP do Lua
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' } -- Reconhece 'vim' como uma variável global
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true), -- Faz o LSP reconhecer a biblioteca Neovim
				checkThirdParty = false, -- Desativa verificação de pacotes externos
			},
		}
	}
})
lspconfig.gopls.setup({})

