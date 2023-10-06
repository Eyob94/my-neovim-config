local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({ buffer = bufnr })
end)

lsp.ensure_installed({
    'bashls',
    'clangd',
    'cssls',
    'dockerls',
    'gopls',
    'graphql',
    'html',
    'jsonls',
    'pyright',
    'rust_analyzer',
    'sqlls',
    'tsserver',
    'vimls',
    'yamlls',
})

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['lua_ls'] = { 'lua' },
        ['pyright'] = { 'python' },
        ['rust_analyzer'] = { 'rust' },
        ['null-ls'] = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
        ['gopls'] = { 'go' },
        ['bashls'] = { 'sh' },
        ['vimls'] = { 'vim' },
        ['yamlls'] = { 'yaml' },
        ['jsonls'] = { 'json' },
        ['html'] = { 'html' },
        ['cssls'] = { 'css' },
        ['dockerls'] = { 'dockerfile' },
        ['graphql'] = { 'graphql' },
        -- ['sqlls'] = { 'sql' },
        ['clangd'] = { 'c', 'cpp' },
    }
})

lsp.setup()
