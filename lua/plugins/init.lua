-- Configuração do tema
--vim.cmd 'silent! colorscheme catppuccin-frappe'

-- Carregar packer e configurações de Jupytext
vim.cmd [[
packadd packer.nvim
silent! colorscheme catppuccin-frappe
nmap ]x ctrih/^# %%<CR><CR>
]]

-- Configuração do Packer
require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'nvim-tree/nvim-tree.lua'
	use 'nvim-tree/nvim-web-devicons'
	-- Redirecionamento
	use {'neoclide/coc.nvim', branch = 'release'}
	-- Gerenciamento de LSP
	use {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'neovim/nvim-lspconfig',
	}
	-- Fechamento automático de parênteses
	use 'rstacruz/vim-closer'

	-- Statusline com Lualine
	use {
		'nvim-lualine/lualine.nvim',
		config = function()
			require('lualine').setup {
				options = {
					theme = 'catppuccin-frappe',
					section_separators = { left = '', right = '' },
					component_separators = { left = '', right = '' },
				}
			}
		end
	}
	-- themes
	use "rebelot/kanagawa.nvim"

	-- Telescope para busca
	use {
		'nvim-telescope/telescope.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
	}
	-- Treesitter para realce de sintaxe
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			require('nvim-treesitter.install').update({ with_sync = true })()
		end
	}
	-- Autocompletar com nvim-cmp
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'saadparwaiz1/cmp_luasnip',
			'L3MON4D3/LuaSnip'
		}
	}
	use{
		"nvim-neotest/nvim-nio",
	}
	-- DAP + suporte para .NET (vsdbg)
	use {
		'mfussenegger/nvim-dap',
		'rcarriga/nvim-dap-ui',
	}
	-- Tema Catppuccin
	use { 'catppuccin/nvim', as = 'catppuccin' }
end)

-- Carregar configurações dos plugins

require("plugins.treesitter")
require("plugins.nvim-tree")
require("plugins.MasonInitializer")
require("plugins.dap-configure")
