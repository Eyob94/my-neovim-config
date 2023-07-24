require('lualine').setup {
  options = {
	icons_enabled = true,
	theme = 'tokyonight-night',
  },
  sections = {
	lualine_a = {
	  {
		'filename',
		path = 1,
	  }
	}
  }
}
