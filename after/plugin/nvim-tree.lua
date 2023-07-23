local nvimMappings = require('after/plugin/nvim-tree-mappings')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


require('nvim-tree').setup({
    on_attach = nvimMappings.on_attach,
	sort_by = 'case-sensitive',
	update_cwd = true,
	hijack_cursor = true,
	diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
	},
	view = {
		width = 30,
		side = 'left',
		number = true,
		mappings = {
		  custom_only = false,
		},
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	  },
})

