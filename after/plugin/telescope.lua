local actions = require("telescope.actions")

require('telescope').load_extension('opener')


require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ["<M-n]"] = actions.move_selection_next,
                ["<M-p>"] = actions.move_selection_previous,
            },
            n = {
                ["<esc>"] = actions.close,
                ["i"] = actions.move_selection_previous,
                ["k"] = actions.move_selection_next,
                ["I"] = actions.move_to_top,
                ["K"] = actions.move_to_bottom,
                ["l"] = actions.select_default,
                ["q"] = actions.close,
            }
        }
    }
    ,
    extensions = {
        opener = {
            hidden = false,
            root_dir = "~",
            respect_gitignore = true,
        }
    }
})


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>jj', builtin.git_files, {})
vim.keymap.set('n', '<leader>gw', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fc', builtin.commands, {})
vim.keymap.set('n', '<leader>fr', builtin.registers, {})
vim.keymap.set('n', '<leader>fs', builtin.spell_suggest, {})
vim.keymap.set('n', '<leader>fl', builtin.current_buffer_fuzzy_find, {})
