require('catppuccin').setup({
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = true,
        mini = true,
        mason = true,
        alpha = true,

    }
    ,
    highlight_overrides = {
        mocha = function(mocha)
            return {
                Normal = { bg = "#161616" }
            }
        end
    }
})
