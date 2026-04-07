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
	use {
		'https://github.com/JavaHello/spring-boot.nvim',
		'https://github.com/MunifTanjim/nui.nvim',
		'https://github.com/nvim-java/nvim-java',
	}
	use 'nvim-lua/plenary.nvim'

	use 'crispgm/nvim-go'

	use 'rcarriga/nvim-notify'

	use 'neovim/nvim-lspconfig'

	-- Fechamento automático de parênteses
	use 'rstacruz/vim-closer'
	use {
		'nvimdev/dashboard-nvim',
		event = 'VimEnter',
		config = function()
			require('dashboard').setup({
				theme = 'hyper',
				config = {
					shortcut = {
						{ desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
						{
							icon = ' ',
							icon_hl = '@variable',
							desc = 'Files',
							group = 'Label',
							action = 'Telescope find_files',
							key = 'f',
						},
						{
							desc = ' Apps',
							group = 'DiagnosticHint',
							action = 'Telescope app',
							key = 'a',
						},
						{
							desc = ' dotfiles',
							group = 'Number',
							action = 'Telescope dotfiles',
							key = 'd',
						},
					},
				},
			})
		end,
		requires = {'nvim-tree/nvim-web-devicons'}
	}
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
require('catppuccin').setup({
	transparent_background = true
})
require("plugins.treesitter")
require("plugins.nvim-tree")
require("plugins.MasonInitializer")
require('java').setup()
vim.lsp.enable('jdtls')

--require("plugins.dap-configure")

-- Configuração do tema
--vim.cmd 'silent! colorscheme catppuccin-frappe'

-- Carregar packer e configurações de Jupytext
vim.cmd [[
packadd packer.nvim
silent! colorscheme catppuccin
nmap ]x ctrih/^# %%<CR><CR>
]]


