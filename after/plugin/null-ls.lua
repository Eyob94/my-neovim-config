local formatting = require 'null-ls'.builtins.formatting

local code_actions = require 'null-ls'.builtins.code_actions

local diagnostics = require 'null-ls'.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {
})

require('null-ls').setup({
    on_attach = function(client, bufnr)
        if client.supports_method('textDocument/formatting') then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format()
                end
            })
        end
    end,
    sources = {
        formatting.prettierd,
        formatting.stylua,
        formatting.shfmt,
        formatting.black,
        formatting.isort,
        formatting.rustfmt,
        formatting.gofmt,
        formatting.gofumpt,
        formatting.lua_format,
        formatting.sqlformat,
        formatting.sqlformat,

        diagnostics.flake8,
        diagnostics.eslint_d,
        diagnostics.golangci_lint,

        code_actions.eslint_d,
        code_actions.impl

    }

})
