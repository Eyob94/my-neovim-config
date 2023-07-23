require('lualine').setup {
  options = {
	icons_enabled = true,
	theme = 'night-owl',
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
