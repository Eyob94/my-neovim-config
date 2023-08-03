require('dapui').setup({
    icons = {
        expanded = "▾",
        collapsed = "▸",
        circular = "↺",
    },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
    },
    sidebar = {
        open_on_start = true,
        elements = {
            -- You can change the order of elements in the sidebar
            "scopes",
            "breakpoints",
            "stacks",
            "watches",
        },
        width = 40,
        position = "left", -- Can be "left" or "right"
    },
    tray = {
        open_on_start = true,
        elements = {
            "repl",
        },
        height = 20,
        position = "bottom", -- Can be "bottom" or "top"
    },
})
