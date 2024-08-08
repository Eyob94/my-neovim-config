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
