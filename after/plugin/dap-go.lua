require('dap-go').setup({
    on_attach = function()
        require('dap-go').test_runner = 'gotest'
        require('dap-go').debugger = 'dlv'
    end
})

