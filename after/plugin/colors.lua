function ColorMyScreen(color)
    color = color or 'tokyonight-night'

    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(1, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(1, 'NormalFloat', { bg = 'none' })
end

ColorMyScreen('oxocarbon')
