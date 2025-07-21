return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },

	version = "1.*",

	opts = {
		keymap = {
			preset = "default",
			["<M-k>"] = { "select_prev", "fallback" },
			["<M-j>"] = { "select_next", "fallback" },
		},

		appearance = {
			nerd_font_variant = "mono",
		},
		cmdline = {
			keymap = { preset = "inherit" },
			completion = { menu = { auto_show = true } },
		},

		completion = {
			documentation = { auto_show = false },
			ghost_text = { enabled = true },
			menu = {
				draw = {
					components = {
						label = { width = { fill = true, max = 50 } },
					},
					columns = {
						{ "label" },
						{ "kind" },
					},
				},
			},
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
