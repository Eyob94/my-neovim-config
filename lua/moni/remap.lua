local opts = { noremap = true, silent = true }
vim.g.mapleader = " "
-- .netrw configs
vim.keymap.set("n", "<leader>rw", vim.cmd.Ex)

-- cmdline entry
vim.keymap.set("n", ";", ":")

-- Navigate buffers
vim.keymap.set("n", "<Tab>j", ":bnext<CR>")
vim.keymap.set("n", "<Tab>k", ":bprevious<CR>")
vim.keymap.set("n", "<M-w>", "<C-w>")

vim.keymap.set("n", "J", "<S-j>")
--Code Block navigation
vim.keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv", opts)

-- Navigation
--map <silent> <leader>w :lua require('nvim-window').pick()<CR>
vim.keymap.set("n", "<leader>w", "<cmd>lua require('nvim-window').pick()<CR>")
-- vim.keymap.set('n', 'i', 'k')
-- vim.keymap.set('n', 'j', 'h')
-- vim.keymap.set('n', 'k', 'j')
-- vim.keymap.set('n', 'H', 'I')
--
-- vim.keymap.set('v', 'i', 'k')
-- vim.keymap.set('v', 'j', 'h')
-- vim.keymap.set('v', 'k', 'j')

vim.keymap.set("n", "<leader>m", "M")
-- vim.keymap.set("n", "<leader>to", "H")
-- vim.keymap.set("n", "<leader>b", "L")

-- Insert
-- vim.keymap.set('n', 'h', 'i')
-- vim.keymap.set('n', 'H', 'I')
-- vim.keymap.set('v', 'h', 'i')
-- vim.keymap.set('v', 'H', 'I')

--delete and change navigation

-- for i = 0, 999 do
--     --delete
--     vim.keymap.set('n', 'd' .. i .. 'i', 'd' .. i .. 'k', opts)
--     vim.keymap.set('n', 'd' .. i .. 'k', 'd' .. i .. 'j', opts)
--     vim.keymap.set('n', 'd' .. i .. 'j', 'd' .. i .. 'h', opts)
--     vim.keymap.set('n', 'dh', 'di', opts)
--
--     --change
--     vim.keymap.set('n', 'c' .. i .. 'i', 'c' .. i .. 'k', opts)
--     vim.keymap.set('n', 'c' .. i .. 'k', 'c' .. i .. 'j', opts)
--     vim.keymap.set('n', 'c' .. i .. 'j', 'c' .. i .. 'h', opts)
--     vim.keymap.set('n', 'ch', 'ci', opts)
--
--     --wrap
--     vim.keymap.set('v', 'vi', 'vh', opts)
-- end

-- vim.keymap.set('n', 'dk', 'dj')
-- vim.keymap.set('n', 'dj', 'dh')
-- vim.keymap.set('n', 'di', 'dk')
-- vim.keymap.set('n', 'ci', 'ch')
-- vim.keymap.set('n', 'cj', 'ch')
-- vim.keymap.set('n', 'ck', 'ch')

-- Nvim Tree Keymaps
vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", opts)
vim.keymap.set("i", "<C-b>", "<cmd>:NvimTreeToggle<CR>", opts)
vim.keymap.set("v", "<C-b>", ":NvimTreeToggle<CR>", opts)

--Clipboard remaps
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')

vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>p", '"+p')

--Tmux Navigation
vim.keymap.set("n", "<M-j>", "<cmd> TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<M-k>", "<cmd> TmuxNavigateDown<CR>")
vim.keymap.set("n", "<M-i>", "<cmd> TmuxNavigateUp<CR>")
vim.keymap.set("n", "<M-l>", "<cmd> TmuxNavigateRight<CR>")

-- debugging
vim.keymap.set("n", "<M-b>", '<cmd>lua require("dap").continue()<CR>', opts)
vim.keymap.set("n", "<M-x>", '<cmd>lua require("dap").toggle_breakpoint()<CR>', opts)
vim.keymap.set("n", "<M-r>", '<cmd>lua require("dap").repl.open()<CR>', opts)
vim.keymap.set("n", "<M-v>", '<cmd>lua require("dap").step_over()<CR>', opts)
vim.keymap.set("n", "<M-i>", '<cmd>lua require("dap").step_into()<CR>', opts)
vim.keymap.set("n", "<M-o>", '<cmd>lua require("dap").step_out()<CR>', opts)
vim.keymap.set("n", "<M-u>", '<cmd>lua require("dapui").toggle()<CR>', opts)

--tab navigation
vim.keymap.set("n", "tn", ":tabnext<CR>")
vim.keymap.set("n", "tp", ":tabprevious<CR>")
vim.keymap.set("n", "tq", ":tabclose<CR>")
vim.keymap.set("n", "te", ":tabedit<CR>")
vim.keymap.set("n", "ts", ":tab split<CR>")
vim.keymap.set("n", "tv", ":tab vsplit<CR>")

--commenting

--lsp binds
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
vim.keymap.set("n", "gpr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
vim.keymap.set("n", "gpi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
vim.keymap.set("n", "<leader>h", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
vim.keymap.set("n", "T", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
vim.keymap.set("n", "<leader>Ne", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
vim.keymap.set("n", "<leader>ne", '<cmd>lua vim.diagnostic.goto_next({border="rounded"})<CR>', opts)
vim.keymap.set("n", "gl", "<cmd>lua vim.lsp.diagnostic.open_float()<CR>", opts)

vim.keymap.set("n", "gx", '<cmd>lua require("goto-preview").close_all_win()<CR>', opts)
vim.keymap.set("n", "gr", '<cmd>lua require("goto-preview").goto_preview_references()<CR>', opts)
vim.keymap.set("n", "gi", '<cmd>lua require("goto-preview").goto_preview_implementation()<CR>', opts)
vim.keymap.set("n", "gpd", '<cmd>lua require("goto-preview").goto_preview_definition()<CR>', opts)

-- scrolling

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- navigate search

-- trouble

vim.keymap.set("n", "<leader>tl", "<cmd>TroubleToggle<cr>", opts)

--wrapping
vim.keymap.set("n", "<M-z>", "<cmd>set wrap!<CR>", opts)

--treesitter textobjects
