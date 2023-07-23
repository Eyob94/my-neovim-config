return require("packer").startup(function(use)
	use 'wbthomason/packer.nvim'
	
	-- fuzzy finder plugins
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	--color theme plugins
	use ({
		'oxfist/night-owl.nvim',
		as = 'night-owl'
	})
    use ({
        'folke/tokyonight.nvim',
        as = 'tokyonight',
    })

	-- nvim-tree plugins
	use 'nvim-tree/nvim-tree.lua'
	use 'nvim-tree/nvim-web-devicons'

	-- lualine plugins
	use 'nvim-lualine/lualine.nvim'

	-- cmp plugins
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'

	--snippets
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'rafamadriz/friendly-snippets'
	
	-- treesitter plugins
	use (
		'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}
	)

	-- undo plugins
	use 'mbbill/undotree'

	use 'tpope/vim-fugitive'

	-- lsp plugins
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.api.nvim_command, 'MasonUpdate')
				end,
			},
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	}

	use {
		"williamboman/mason.nvim",
		run = ":MasonUpdate" -- :MasonUpdate updates registry contents
	}
	
	-- autopair plugins
	use 'windwp/nvim-autopairs'
end)

