require("tokyonight").setup({
	style = "moon",
	terminal_colors = true,
	transparent = true,
	styles = {
		comments = {
			italic = true,
		},
		keywords = {
			italic = true,
		},
		functions = {
			italic = true,
		},
		sidebars = "dark",
		floats = "dark",
	},
	sidebars = { "qf", "vista_kind", "terminal", "packer" },
	hide_inactive_statusline = false,
	dim_inactive = false,
	lualine_bold = false,
	on_colors = function(colors)
		colors.error = "#ff0000"
	end,

	on_highlights = function(hl, c)
		local prompt = "#2d3149"
		local border = "#C098FF"
		hl.TelescopeNormal = {
			fg = c.fg_dark,
			bg = c.bg_dark,
		}
		hl.TelescopeBorder = {
			bg = c.bg_dark,
			fg = border,
		}
		hl.TelescopePromptNormal = {
			bg = prompt,
		}
		hl.TelescopePromptBorder = {
			bg = prompt,
			fg = prompt,
		}
		hl.TelescopePromptTitle = {
			bg = prompt,
			fg = prompt,
		}
		hl.TelescopePreviewTitle = {
			bg = c.bg_dark,
			fg = c.fg_dark,
		}
		hl.TelescopeResultsTitle = {
			bg = c.bg_dark,
			fg = c.fg_dark,
		}
	end,
})
