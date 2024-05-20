return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    --motion
    use("ggandor/leap.nvim")

    -- tmux plugins
    use("christoomey/vim-tmux-navigator")

    -- fuzzy finder plugins
    use({
        "nvim-telescope/telescope.nvim",
        -- or                            , branch = '0.1.x',
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    --color theme plugins
    use({
        "rose-pine/neovim",
        as = "rose-pine",
    })
    require("rose-pine").setup({
        disable_background = true,
        disable_float_background = true,
    })
    use({
        "oxfist/night-owl.nvim",
        as = "night-owl",
    })
    use({
        "folke/tokyonight.nvim",
        as = "tokyonight",
    })
    require("tokyonight").setup({
        transparent = true,
    })
    use({
        "catppuccin/nvim",
        as = "catppuccin",
    })
    use({
        "nyoom-engineering/oxocarbon.nvim",
        as = "oxocarbon",
    })
    use({
        "EdenEast/nightfox.nvim",
        as = "nightfox",
    })

    use({ "ellisonleao/gruvbox.nvim" })
    require("gruvbox").setup({
        transparent_mode = true,
    })
    -- nvim-tree plugins
    -- use("nvim-tree/nvim-tree.lua")
    -- use("nvim-tree/nvim-web-devicons")

    -- lualine plugins
    use("nvim-lualine/lualine.nvim")

    -- cmp plugins
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")

    --snippets
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")

    -- treesitter plugins
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    })

    -- undo plugins
    use("mbbill/undotree")

    -- git plugins
    use("rhysd/conflict-marker.vim")
    use("tpope/vim-fugitive")
    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                current_line_blame = true,
                current_line_blame_opts = {
                    delay = 150,
                },
            })
        end,
    })

    -- lsp plugins
    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" }, -- Required
            {                            -- Optional
                "williamboman/mason.nvim",
                run = function()
                    pcall(vim.api.nvim_command, "MasonUpdate")
                end,
            },
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },     -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "L3MON4D3/LuaSnip" },     -- Required
        },
    })

    use({
        "williamboman/mason.nvim",
        run = ":MasonUpdate", -- :MasonUpdate updates registry contents
    })
    use("kabouzeid/nvim-lspinstall")

    -- autopair plugins
    use("windwp/nvim-autopairs")
    use("windwp/nvim-ts-autotag")

    --debugger
    use({ "mfussenegger/nvim-dap", opt = true, module = { "dap" }, disable = false })

    use("rcarriga/nvim-dap-ui")
    use("leoluz/nvim-dap-go")
    use("theHamsta/nvim-dap-virtual-text")
    use("nvim-telescope/telescope-dap.nvim")
    use("mxsdev/nvim-dap-vscode-js")
    use({
        "microsoft/vscode-js-debug",
        opt = true,
        run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
    })

    -- lsp formatting
    use("jose-elias-alvarez/null-ls.nvim")

    --surround nvim
    use("tpope/vim-surround")

    -- session manager
    use({
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup({
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            })
        end,
    })
    use("JoosepAlviste/nvim-ts-context-commentstring") -- Changes commentstring to use based on cursor position
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup({
                padding = true,
                sticky = true,
                ignore = nil,
                toggler = { line = "<leader>cc", block = "<leader>cbc" },
                opleader = { line = "<leader>c", block = "<leader>cb" },
                extra = { above = "<leader>cO", below = "<leader>co", eol = "<leader>cA" },
                mappings = { basic = true, extra = true },
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
                post_hook = nil,
            })
        end,
    })

    --navigation
    -- use("https://gitlab.com/yorickpeterse/nvim-window.git")

    --window dimmer
    use("miversen33/sunglasses.nvim")

    --markdown previewer

    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    })

    -- Discord presence
    use("andweeb/presence.nvim")


    -- Rust plugin
    use {
        'mrcjkb/rustaceanvim',
        version = '^4',
    }


    -- Test Suite
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-jest",
        },
        -- config = function()
        --     require('neotest').setup({
        --         discover = {
        --             enabled = true
        --         },
        --         adapters = {
        --             require('neotest-jest')({
        --                 jestCommand = require('neotest-jest.jest-util').getJestCommand(vim.fn.expand '%:p:h') ..
        --                     ' --watch',
        --
        --                 -- jestCommand = "pnpm test -- --detectOpenHandles",
        --                 jestConfigFile = "jest.config.ts",
        --                 env = { CI = true },
        --                 cwd = function(path)
        --                     return vim.fn.getcwd()
        --                 end,
        --             }),
        --         }
        --     })
        -- end
        --
        --
        --
    }
    use({
        'projekt0n/github-nvim-theme',
        config = function()
            require('github-theme').setup({
                -- ...
            })

            vim.cmd('colorscheme github_dark_high_contrast')
        end
    })


    -- Asynchronous task runner
    use { "nvim-neotest/nvim-nio" }
end)
