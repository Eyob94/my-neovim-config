require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "javascript",
        "typescript",
        "go",
        "python",
        "prisma",
        "css",
        "html",
        "markdown_inline",
        "make",
        "lua",
        "gosum",
        "gomod",
        "graphql",
        "dockerfile",
        "json",
        "rust",
        "sql",
        "terraform",
        "toml",
        "vim",
        "yaml",
        "vimdoc",
        "query",
    },
    autopairs = {
        enable = true,
    },
    sync_install = false,

    auto_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    indent = {
        enable = true,
        disable = {
            "yaml",
        },
    },
})
