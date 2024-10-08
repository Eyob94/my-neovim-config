local formatting = require("null-ls").builtins.formatting

local code_actions = require("null-ls").builtins.code_actions

local diagnostics = require("null-ls").builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

require("null-ls").setup({
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			-- vim.api.nvim_create_autocmd("BufWritePre", {
			--     group = augroup,
			--     buffer = bufnr,
			--     callback = function()
			--         vim.lsp.buf.format()
			--     end
			-- })
		end
	end,
	sources = {
		formatting.prettierd,
		formatting.stylua,
		formatting.shfmt,
		formatting.black,
		formatting.isort,
		formatting.rustfmt,
		formatting.gofumpt,
		formatting.lua_format,
		formatting.sqlfmt,
		formatting.clang_format,
		formatting.beautysh,
		formatting.csharpier,
        formatting.yamlfmt,
        formatting.taplo,


		diagnostics.ruff,
		diagnostics.eslint_d,
		diagnostics.golangci_lint,
		diagnostics.cpplint,
		diagnostics.sqlfluff,
        diagnostics.semgrep,

		-- code_actions.semgrep,
		code_actions.eslint_d,
		code_actions.impl,
	},
})
