require("nvim-window").setup({
	chars = {
		"a",
		"b",
		"c",
		"d",
		"e",
		"f",
		"g",
		"h",
		"i",
		"j",
		"k",
		"l",
		"m",
		"n",
		"o",
		"p",
		"q",
		"r",
		"s",
		"t",
		"u",
		"v",
		"w",
		"x",
		"y",
		"z",
	},

	normal_hl = "Normal",
	-- The highlight group to apply to the line that contains the hint characters.
	-- This is used to make them stand out more.
	hint_hl = "Bold",
	-- The border style to use for the floating window.
	border = "single",
})
