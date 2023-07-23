vim.g.mapleader = " "

-- .netrw configs
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)


vim.keymap.set('i', '<A-C>', '<ESC>') 
vim.keymap.set('v', '<A-C>', '<ESC>')

-- Navigate buffers
vim.keymap.set('n', '<S-l>', ':bnext<CR>')
vim.keymap.set('n', '<S-h>', ':bprevious<CR>')

-- Nvim Tree Keymaps
vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>')

