-- .netrw configs
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Mode Navigation
vim.keymap.set('i', ';;', '<ESC>')
vim.keymap.set('i', '::', '<ESC>')
vim.keymap.set('v', ';;', '<ESC>')
vim.keymap.set('v', '::', '<ESC>')

-- Navigate buffers
vim.keymap.set('n', '<S-j>', ':bnext<CR>')
vim.keymap.set('n', '<S-k>', ':bprevious<CR>')

--Navigate splits
vim.keymap.set('n', '<S-h>', '<C-w>h')
vim.keymap.set('n', '<S-l>', '<C-w>l')

--Code navigation
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

-- Nvim Tree Keymaps
vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>')


--Clipboard remaps
vim.keymap.set('n', '<leader>y', '\"+y')
vim.keymap.set('n', '<leader>p', '"+p')

vim.keymap.set('v', '<leader>y', '\"+y')
vim.keymap.set('v', '<leader>p', '\"+p')

--Nav
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
