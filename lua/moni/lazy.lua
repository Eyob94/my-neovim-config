local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local plugins = {
    "ggandor/leap.nvim",
    "christoomey/vim-tmux-navigator",

    {
        "nvim-telescope/telescope.nvim",
        dependencise = {
            "nvim-lua/plenary.nvim"
        }
    },
    {
        "folke/tokyonight.nvim",
        name = "tokyonight"
    },
    {
        "catppuccin/nvim",
        name = "catppuccin"
    },

    -- status line
    "nvim-lualine/lualine.nvim",

    -- cmp plugins
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    {
        "hrsh7th/cmp-nvim-lsp",
        opts = {
            setup = {
                rust_analyzer = function()
                    return true
                end,
            },
        },
    },
    "L3MON4D3/LuaSnip", -- Required

    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",

    -- syntax highlight and navigation
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    },
    "nvim-treesitter/nvim-treesitter-textobjects",

    -- git plugins
    "rhysd/conflict-marker.vim",
    "tpope/vim-fugitive",
    "lewis6991/gitsigns.nvim",

    -- lsp plugins
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x"
    },

    {
        "williamboman/mason.nvim",
        build = function()
            pcall(vim.api.nvim_command, "MasonUpdate")
        end
    },

    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "glepnir/lspsaga.nvim",

    -- comment plugins
    "JoosepAlviste/nvim-ts-context-commentstring",
    "numToStr/Comment.nvim",

    -- autopair plugins
    "windwp/nvim-autopairs",
    "windwp/nvim-ts-autotag",

    -- lsp formatting
    "nvimtools/none-ls.nvim",

    -- surround nvim
    "tpope/vim-surround",

    -- Rust plugin
    {
        "mrcjkb/rustaceanvim",
        version = "^4"
    },


    -- debuggers
    {
        "mfussenegger/nvim-dap",
        enabled = true,
        module = { "dap" },
        lazy = true,
    },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "nvim-neotest/nvim-nio"
        }
    },
    "leoluz/nvim-dap-go",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",


    --undo plugins
    "mbbill/undotree",


    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter"
        }
    }
}

local opts = {}

require("lazy").setup(plugins, opts)
