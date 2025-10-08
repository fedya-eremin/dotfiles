return {
	"mistweaverco/kulala.nvim",
	keys = {
		{ "<leader>sr", desc = "Send request" },
		{ "<leader>sar", desc = "Send all requests" },
		{ "<leader>ok", desc = "Open scratchpad" },
	},
	ft = { "http", "rest" },
	opts = {
		-- your configuration comes here
		global_keymaps = true,
		global_keymaps_prefix = "<leader>R",
		kulala_keymaps_prefix = "",
	},
}
