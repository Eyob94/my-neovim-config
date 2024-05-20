local actions = require("telescope.actions")

require("telescope").setup({
    pickers = {
        find_files = {
            hidden = true,
        },
    },
    defaults = {
        file_ignore_patterns = {
            ".git",
            "node_modules",
        },
        mappings = {
            i = {
                ["<C-n>"] = actions.move_selection_next,
                ["<C-p>"] = actions.move_selection_previous,
            },
            n = {
                ["<esc>"] = actions.close,
                ["k"] = actions.move_selection_previous,
                ["j"] = actions.move_selection_next,
                ["K"] = actions.move_to_top,
                ["J"] = actions.move_to_bottom,
                ["l"] = actions.select_default,
                ["q"] = actions.close,
            },
        },
    },
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>jj", builtin.git_files, {})
vim.keymap.set("n", "<leader>gw", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fc", builtin.colorscheme, {})
vim.keymap.set("n", "<leader>fr", builtin.registers, {})
vim.keymap.set("n", "<leader>fs", builtin.spell_suggest, {})
vim.keymap.set("n", "<leader>fl", builtin.current_buffer_fuzzy_find, {})
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
