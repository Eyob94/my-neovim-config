vim.g.mapleader = " "

-- .netrw configs
vim.keymap.set('n','<leader>pv', vim.cmd.Ex)

-- Mode Navigation
vim.keymap.set('i', ';;', '<ESC>')
vim.keymap.set('v', ';;', '<ESC>')

-- Clipboard Register
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>p', '"+p')


-- Navigate buffers
vim.keymap.set('n', '<S-l>', ':bnext<CR>')
vim.keymap.set('n', '<S-h>', ':bprevious<CR>')

-- Move text up and down
vim.keymap.set('x', 'J', ":move '>+1<CR>gv-gv")
vim.keymap.set('x', 'K', ":move '<-2<CR>gv-gv")


-- Nvim Tree Keymaps
vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>')
