local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set(
    "n",
    "<leader>i",
    function()
        vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
        -- or vim.lsp.buf.codeAction() if you don't want grouping.
    end,
    { silent = true, buffer = bufnr }
)

vim.keymap.set("n", "<leader>k", function()
    vim.cmd.RustLsp { 'hover', 'actions' }
end
)

vim.g.rustaceanvim = {
    tools = {
        hover = {
            auto_focus = true
        }
    }
}
