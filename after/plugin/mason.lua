local servers = {
    'pyright',
    'clangd',
    'rust_analyzer',
    'tsserver',
    'gopls',
    'bashls',
    'vimls',
    'yamlls',
    'jsonls',
    'html',
    'cssls',
    'dockerls',
    'graphql',
    'tailwindcss',
}

for _, server in pairs(servers) do
    require('lspconfig')[server].setup {
        on_attach = function(client, bufnr)
            if client.supports_method('textDocument/formatting') then
                vim.api.nvim_exec([[
                    augroup LspFormatting
                        autocmd! * <buffer>
                        autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
                    augroup END
                ]], false)
            end
        end
    }
end
