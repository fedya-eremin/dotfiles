return {
	"NeogitOrg/neogit",
	dependencies = {
		"sindrets/diffview.nvim", -- optional - Diff integration
	},
	config = true,
	keys = {
		{
			"<leader>p",
			function()
				require("neogit").open()
			end,
		},
	},
}
