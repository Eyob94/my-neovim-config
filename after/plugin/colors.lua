function ColorMyScreen(color)
    color = color or "carbonfox"

    vim.cmd.colorscheme(color)
end

ColorMyScreen()
