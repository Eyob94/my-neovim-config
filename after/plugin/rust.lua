local ok, lspconfig = pcall(require, 'lspconfig')
if not ok or vim.g.__ra_setup_done then return end
vim.g.__ra_setup_done = true

local ra_target = vim.fn.stdpath('cache') .. '/ra-target'
vim.fn.mkdir(ra_target, 'p')

lspconfig.rust_analyzer.setup {
    cmd = { "rustup", "run", "1.88.0", "rust-analyzer" },
    flags = { debounce_text_changes = 300 },
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                target = nil,
                features = "diesel-support",
                allTargets = false,
                buildScripts = { enable = true },
                allFeatures = true,
                extraEnv = { CARGO_TARGET_DIR = ra_target },
                noDefaultFeatures = false
            },
            procMacro = { enable = true },
            checkOnSave = { enable = true, command = "clippy", extraArgs = {}, },
            files = { watcher = "server", excludeDirs = { "target", "node_modules", "dist", ".git" } },
            lruCapacity = 256,
            check = { command = "clippy", allTargets = true, allFeatures = true },
        },
    },
}

-- Dedupe: keep only the rustup-run client
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(a)
        local c = vim.lsp.get_client_by_id(a.data.client_id)
        if not c or c.name ~= "rust_analyzer" then return end
        c.server_capabilities.semanticTokensProvider = nil
        for _, cli in ipairs(vim.lsp.get_active_clients({ name = "rust_analyzer" })) do
            local cmd = table.concat(cli.config.cmd or {}, " ")
            if not cmd:find("rustup run", 1, true) then pcall(vim.lsp.stop_client, cli.id) end
        end
    end
})
