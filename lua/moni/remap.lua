-- .netrw configs
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Mode Navigation
vim.keymap.set('n', ';;', '<ESC>')
vim.keymap.set('v', ';;', '<ESC>')

-- Navigate buffers
vim.keymap.set('n', '<S-l>', ':bnext<CR>')
vim.keymap.set('n', '<S-h>', ':bprevious<CR>')

--Code navigation
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

-- Nvim Tree Keymaps
vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>')


--CLipboard remaps
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>p', '"+p')
