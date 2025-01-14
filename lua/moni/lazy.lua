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
    },

    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "X",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
    },

    {
        "ldelossa/gh.nvim",
        dependencies = {
            {
                "ldelossa/litee.nvim",
                config = function()
                    require("litee.lib").setup()
                end,
            },
        },
        config = function()
            require("litee.gh").setup()
        end,
    },
    "nvim-treesitter/nvim-treesitter-context",


    -- Markdown
    --
    {
        "epwalsh/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",

        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",

        },

        opts = {
            workspaces = {
                {
                    name = "journal",
                    path = "~/vaults/journal"
                },
                {
                    name = "business",
                    path = "~/vaults/business"
                },
                {
                    name = "work",
                    path = "~/vaults/work",
                    overrides = {
                        notes_subdir = "notes",
                    },
                },
            },

        },

        insert_markdown_table = function()
            local get_size = function()
                local INPUT_CANCELLED = "~~~INPUT-CANCELLED~~~"
                local input = vim.fn.input { prompt = "Size of the table - columns by rows (e.g. 2x3)", cancelreturn = INPUT_CANCELLED }
                if input == INPUT_CANCELLED then
                    -- early return if the user cancels the input
                    return nil, nil
                end
                local string_column, string_row = input:match("([^x]+)x([^x]+)")
                return tonumber(string_column), tonumber(string_row)
            end
            local columns, rows = get_size();
            if columns == nil or rows == nil or columns < 1 or rows < 1 then
                vim.api.nvim_err_writeln("Invalid input. Please provide a valid size (e.g. 2x3)")
                return
            end

            -- Create a row
            -- @param row number
            -- @param header boolean
            local create_row = function(length, header)
                local row = "|"
                for _ = 1, length do
                    row = row .. (header and " ---" or "   ") .. " |"
                end
                return row
            end

            local rows_table = {}

            -- First row with header row
            table.insert(rows_table, create_row(columns, false))
            table.insert(rows_table, create_row(columns, true))
            for _ = 2, rows do
                table.insert(rows_table, create_row(columns, false))
            end

            vim.api.nvim_put(rows_table, "l", true, false)
        end,
        keys = {
            { "t", mode = { "n", "x", "o" }, insert_markdown_table },
        }

    }
}

local opts = {}

require("lazy").setup(plugins, opts)
