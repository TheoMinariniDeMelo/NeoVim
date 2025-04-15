require('mason-lspconfig').setup({
	ensure_installed = { "gopls","pyright", "lua_ls", "clangd", "jdtls" },
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
require('lspconfig').clangd.setup({})
require('lspconfig').lua_ls.setup({ -- Nome correto do servidor LSP do Lua
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

require('lspconfig').jdtls.setup {
  -- configuração do jdtsl
}
require("lspconfig").gopls.setup({})

