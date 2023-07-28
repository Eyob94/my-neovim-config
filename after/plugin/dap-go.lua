require('dap-go').setup({
    on_attach = function()
        require('dap-go').test_runner = 'gotest'
        require('dap-go').debugger = 'dlv'
    end
})

vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='🟢', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='🟡', texthl='', linehl='', numhl=''})

