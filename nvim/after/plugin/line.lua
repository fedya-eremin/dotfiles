require("lualine").setup({
	options = {
		theme = require("lualine.themes.gruvbox-material"),
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_x = { "aerial" },
		lualine_b = {
			{
				"diagnostics",
				symbols = {
					error = "󰚌 ",
					warn = "󰸰 ",
					hint = "󰯞 ",
					info = " ",
				},
			},
		},
	},
})
