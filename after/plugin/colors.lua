function ColorMyScreen(color)
	color = color or 'night-owl'

	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(1, 'Normal', { bg = 'none' })
	vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })	
end

ColorMyScreen()
