-- Configuração do tema
vim.cmd 'silent! colorscheme catppuccin-frappe'

-- Carregar packer e configurações de Jupytext
vim.cmd [[
packadd packer.nvim
let g:jupytext_fmt = 'py'
let g:jupytext_style = 'hydrogen'
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
					theme = 'catppuccin',
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
		tag = '0.1.0',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('telescope').setup {
				defaults = {
					prompt_prefix = " ",
					selection_caret = " ",
					layout_strategy = "horizontal",
				}
			}
		end
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
	-- Depuração (DAP) --
	use { 
		'mfussenegger/nvim-dap',
		'mfussenegger/nvim-dap-python',
		'rcarriga/nvim-dap-ui',
		requires = {
			"nvim-neotest/nvim-nio",
			'mfussenegger/nvim-dap',
		}
	}
	-- Suporte a REPL e integração com Jupytext
	use {
		'hkupty/iron.nvim',
		'kana/vim-textobj-user',
		'GCBallesteros/vim-textobj-hydrogen',
		'GCBallesteros/jupytext.vim'
	}
	-- Suporte a Java com nvim-java
	use {
		'nvim-java/nvim-java',
		requires = {
			'nvim-java/nvim-java-refactor',
			'nvim-java/lua-async-await',
			'nvim-java/nvim-java-core',
			'nvim-java/nvim-java-test',
			'nvim-java/nvim-java-dap',
			'MunifTanjim/nui.nvim',
			'neovim/nvim-lspconfig',
			'mfussenegger/nvim-dap',
		}
	}
	-- Tema Catppuccin
	use { 'catppuccin/nvim', as = 'catppuccin' }
end)

-- Carregar configurações dos plugins

require("plugins.treesitter")
require("plugins.iron-core")
require("plugins.nvim-tree")
require("plugins.dap-python")
require("plugins.dap-ui")
require("plugins.MasonInitializer")
require("plugins.java")
