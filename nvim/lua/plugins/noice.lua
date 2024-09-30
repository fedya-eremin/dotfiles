return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- add any options here
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("noice").setup({
			messages = {
				enabled = false,
			},
			cmdline = {
				enabled = true,
			},
			notify = {
				enabled = false,
			},
		})
		vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = "#E0C69F" })
		vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", { fg = "#E0C69F" })
	end,
}
