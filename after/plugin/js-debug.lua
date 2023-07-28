require('dap-vscode-js').setup({
    debugger_path = vim.fn.stdpath('data') .. '/mason/packages/js-debug-adapter',
    debugger_cmd = { 'js-debug-adapter' },
    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
})

for _, language in ipairs({ 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }) do
    require('dap').configurations[language]={
        {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch Program',
            program = '${file}',
            cwd = "${workspaceFolder}",
            sourceMaps = true,
            protocol = 'inspector',
            console = 'integratedTerminal',
        },
        {
            type= "pwa-node",
            request = 'attach',
            name = 'Attach to Process',
            processId = require'dap.utils'.pick_process,
            cwd = "${workspaceFolder}",
        },
        {
            type = 'pwa-chrome',
            request = 'launch',
            name = 'Launch Chrome',
            url = 'http://localhost:3000',
            webRoot = '${workspaceFolder}',
            sourceMaps = true,
            protocol = 'inspector',
            console = 'integratedTerminal',
        },
        {
            type = 'pwa-msedge',
            request = 'launch',
            name = 'Launch Edge',
            url = 'http://localhost:3000',
            webRoot = '${workspaceFolder}',
            sourceMaps = true,
            protocol = 'inspector',
            console = 'integratedTerminal',
        },
        {
            type = 'node-terminal',
            request = 'launch',
            name = 'Launch Program',
            program = '${file}',
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            protocol = 'inspector',
            console = 'integratedTerminal',
        },
        {
            type="pwa-node",
            request = "launch",
            name = "Debug Jest tests",
            runtimeExecutable = "node",
            runtimeArgs = {
                "./node_modules/jest/bin/jest.js",
                "--runInBand",
            },
            rootPath = "${workspaceFolder}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
        }
    }
end
