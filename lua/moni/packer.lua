return require("packer").startup(function(use)
    use 'wbthomason/packer.nvim'

    -- tmux plugins
    use 'christoomey/vim-tmux-navigator'

    -- fuzzy finder plugins
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use 'folke/trouble.nvim'
    use 'rmagatti/goto-preview'

    --color theme plugins
    use({
        'rose-pine/neovim',
        as = 'rose-pine'
    })
    use({
        'oxfist/night-owl.nvim',
        as = 'night-owl'
    })
    use({
        'folke/tokyonight.nvim',
        as = 'tokyonight',

        vim.cmd('colorscheme tokyonight-night')
    })
    use({
        'catppuccin/nvim',
        as = 'catppuccin',
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
    use(
        'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' }
    )

    -- undo plugins
    use 'mbbill/undotree'

    -- git plugins
    use 'tpope/vim-fugitive'
    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require('gitsigns').setup({
                current_line_blame = true,
                current_line_blame_opts = {
                    delay = 150,
                },
            })
        end
    }

    -- lsp plugins
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.api.nvim_command, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }

    use {
        "williamboman/mason.nvim",
        run = ":MasonUpdate" -- :MasonUpdate updates registry contents
    }
    use 'kabouzeid/nvim-lspinstall'
    -- autopair plugins
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'

    --debugger
    use { 'mfussenegger/nvim-dap',
        opt = true,
        module = { 'dap' },
        config = function()
            require("dap").setup()
        end,
        disable = false,
    }


    use 'rcarriga/nvim-dap-ui'
    use 'leoluz/nvim-dap-go'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'nvim-telescope/telescope-dap.nvim'
    use "mxsdev/nvim-dap-vscode-js"
    use {
        "microsoft/vscode-js-debug",
        opt = true,
        run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
    }
    --comment plugins
    use 'preservim/nerdcommenter'

    --command line plugins
    use({
        'folke/noice.nvim',
        requires = {
            'MunifTanjim/nui.nvim',
        }
    })
    use 'rcarriga/nvim-notify'



    -- lsp formatting
    use 'jose-elias-alvarez/null-ls.nvim'

    -- SSH plugins
    use {
        'chipsenkbeil/distant.nvim',
        branch = 'v0.2',
        config = function()
            require('distant').setup {
                ['*'] = require('distant.settings').chip_default()
            }
        end
    }
end)
