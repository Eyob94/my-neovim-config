local DEBUGGER_PATH = vim.fn.stdpath('data') .. '/site/pack/packer/opt/vscode-js-debug'



require("dap-vscode-js").setup {
    node_path = "node",
    debugger_path = DEBUGGER_PATH,
    -- debugger_cmd = { "js-debug-adapter" },
    adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
}

for _, language in ipairs { "typescript", "javascript" } do
    require("dap").configurations[language] = {
        {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            args = { "${file}" },
            cwd = '${workspaceFolder}',
            sourceMaps = true,
            protocol = "inspector",
        },
        {
            type = "pwa-node",
            request = 'launch',
            name = "Launch Program(ts-node)",
            cwd = '${workspaceFolder}',
            runtimeArgs = { '--loader', 'ts-node/esm' },
            args = { '${file}' },
            sourceMaps = true,
            protocol = 'inspector',
            skipFiles = { '<node_internals>/**', 'node_modules/**' },
            resolveSourceMapLocations = { '${workspaceFolder}/**', '!**/node_modules/**' },
        },

        {
            type = "node2",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
            port = 9229,
        },
        {
            type = "pwa-node",
            request = "launch",
            name = "Debug Jest Tests",
            -- trace = true, -- include debugger info
            runtimeExecutable = "node",
            runtimeArgs = {
                "./node_modules/jest/bin/jest.js",
                "--runInBand",
            },
            rootPath = "${workspaceFolder}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
        },
    }
end
