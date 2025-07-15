return {
	"stevearc/oil.nvim",
	tag = "v2.8.0",
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			columns = {
				"icon",
				"mtime",
			},
			keymaps = {
				["<C-h>"] = false,
				["<C-s>"] = false,
				["<C-t>"] = false,
				["<C-l>"] = false,
				["<M-S-L>"] = "actions.refresh",
			},
			watch_for_changes = true,
			skip_confirm_for_simple_edits = true,
		})
	end,
}
