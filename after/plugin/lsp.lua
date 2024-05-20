local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({ buffer = bufnr })
	vim.keymap.set("n", "<leader>i", vim.lsp.buf.code_action, { buffer = bufnr })
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
	vim.keymap.set("n", "<leader>lf", function()
		vim.lsp.buf.format({
			formatting_options = {
				-- trimTrailingWhitespace = true,
				-- trimFinalNewLines = true,
				-- insertFinalNewline = true,
				insert_final_newline = true,
			},
			timeout_ms = 2500,
			-- async = true,
		})
	end)
end)

lsp.ensure_installed({
	"bashls",
    "bufls",
	"clangd",
	"cssls",
	"dockerls",
	"gopls",
    "omnisharp",
	"graphql",
	"html",
	"jsonls",
    "svelte",
	"pyright",
	"sqlls",
	"tsserver",
	"vimls",
	"yamlls",
})

-- lsp.format_on_save({
--     format_opts = {
--         async = false,
--         timeout_ms = 10000,
--     },
--     servers = {
--         ['lua_ls'] = { 'lua' },
--         ['pyright'] = { 'python' },
--         ['null-ls'] = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
--         ['gopls'] = { 'go' },
--         ['gofmt'] = { 'go' },
--         ['goimports'] = { 'go' },
--         ['bashls'] = { 'sh' },
--         ['vimls'] = { 'vim' },
--         ['yamlls'] = { 'yaml' },
--         ['jsonls'] = { 'json' },
--         ['html'] = { 'html' },
--         ['cssls'] = { 'css' },
--         ['dockerls'] = { 'dockerfile' },
--         ['graphql'] = { 'graphql' },
--         ['sqlls'] = { 'sql' },
--         ['clangd'] = { 'c', 'cpp' },
--     }
-- })

lsp.setup()
