require("moni")

vim.cmd.colorscheme("tokyonight-storm")

vim.o.shadafile = vim.fn.stdpath('state') .. '/shada/main-' .. vim.version().major .. '.' .. vim.version().minor .. '.shada'

-- Force Cargo on PATH for LSP subprocesses
do
  local cargo = vim.fn.expand("~/.cargo/bin")
  if not string.find(vim.env.PATH or "", cargo, 1, true) then
    vim.env.PATH = cargo .. ":" .. (vim.env.PATH or "")
  end
end
