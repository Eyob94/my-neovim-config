local opts = { noremap = true, silent = true }

-- .netrw configs
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- cmdline entry
vim.keymap.set('n', ';', ':')

-- Mode Navigation
vim.keymap.set('i', ';;', '<ESC>')
vim.keymap.set('v', ';;', '<ESC>')

-- Navigate buffers
vim.keymap.set('n', '<Tab>i', ':bnext<CR>')
vim.keymap.set('n', '<Tab>k', ':bprevious<CR>')

--Navigate splits
vim.keymap.set('n', '<S-j>', '<C-w>h')
vim.keymap.set('n', '<S-l>', '<C-w>l')
vim.keymap.set('n', '<S-i>', '<C-w>k')
vim.keymap.set('n', '<S-k>', '<C-w>j')
--Code Block navigation
vim.keymap.set('v', 'K', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'I', ':m \'<-2<CR>gv=gv')

-- Navigation
vim.keymap.set('n', 'i', 'k')
vim.keymap.set('n', 'j', 'h')
vim.keymap.set('n', 'k', 'j')

vim.keymap.set('v', 'i', 'k')
vim.keymap.set('v', 'j', 'h')
vim.keymap.set('v', 'k', 'j')

-- Insert
vim.keymap.set('n', 'h', 'i')
vim.keymap.set('n', 'H', 'I')


-- Nvim Tree Keymaps
vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>', opts)


--Clipboard remaps
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>p', '"+p')

vim.keymap.set('v', '<leader>y', '\"+y')
vim.keymap.set('v', '<leader>p', '\"+p')


--Tmux Navigation
vim.keymap.set('n', '<M-j>', '<cmd> TmuxNavigateLeft<CR>')
vim.keymap.set('n', '<M-k>', '<cmd> TmuxNavigateDown<CR>')
vim.keymap.set('n', '<M-i>', '<cmd> TmuxNavigateUp<CR>')
vim.keymap.set('n', '<M-l>', '<cmd> TmuxNavigateRight<CR>')


-- debugging
vim.keymap.set('n', '<M-b>', '<cmd>lua require("dap").continue()<CR>', opts)
vim.keymap.set('n', '<M-x>', '<cmd>lua require("dap").toggle_breakpoint()<CR>', opts)
vim.keymap.set('n', '<M-r>', '<cmd>lua require("dap").repl.open()<CR>', opts)
vim.keymap.set('n', '<M-v>', '<cmd>lua require("dap").step_over()<CR>', opts)
vim.keymap.set('n', '<M-i>', '<cmd>lua require("dap").step_into()<CR>', opts)
vim.keymap.set('n', '<M-o>', '<cmd>lua require("dap").step_out()<CR>', opts)
vim.keymap.set('n', '<M-u>', '<cmd>lua require("dapui").toggle()<CR>', opts)

--tab navigation
vim.keymap.set('n', 'tn', ':tabnext<CR>')
vim.keymap.set('n', 'tp', ':tabprevious<CR>')
vim.keymap.set('n', 'tc', ':tabclose<CR>')
vim.keymap.set('n', 'te', ':tabedit<CR>')
vim.keymap.set('n', 'ts', ':tab split<CR>')
vim.keymap.set('n', 'tv', ':tab vsplit<CR>')


--commenting

--lsp binds
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.keymap.set('n', 'm', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.keymap.set('n', 'T', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.keymap.set('n', 'pe', '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
vim.keymap.set('n', 'ne', '<cmd>lua vim.diagnostic.goto_next({border="rounded"})<CR>', opts)
vim.keymap.set('n', 'gl', '<cmd>lua vim.lsp.diagnostic.open_float()<CR>', opts)
