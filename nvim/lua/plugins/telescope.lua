return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			telescope.setup({
				pickers = {
					find_files = {
						previewer = false,
						theme = "dropdown",
					},
					buffers = {
						initial_mode = "normal",
						theme = "dropdown",
						mappings = {
							n = {
								["d"] = actions.delete_buffer,
							},
							i = {
								["<C-d>"] = actions.delete_buffer,
							},
						},
						previewer = false,
					},
					live_grep = {
						theme = "dropdown",
						-- mappings = {
						-- 	n = {
						-- 		["<C-q>"] = actions.smart_add_to_qflist,
						-- 	},
						-- },
					},
					git_files = {
						theme = "dropdown",
						previewer = false,
					},
				},
				extensions = {
					aerial = {},
				},
			})

			local builtin = require("telescope.builtin")
			telescope.load_extension("fzf")
			telescope.load_extension("aerial")
			vim.keymap.set("n", "<A-v>", function()
				builtin.find_files({ cwd = "." })
			end, {})
			vim.keymap.set("n", "<leader>g", builtin.git_files, {})
			vim.keymap.set("n", "<leader>b", builtin.buffers, {})
			vim.keymap.set("n", "<leader>ht", builtin.help_tags, {})
			vim.keymap.set("n", "<leader>j", builtin.keymaps, {})
			vim.keymap.set("n", "<leader>rg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fl", builtin.quickfix, {})
			vim.keymap.set("n", "<leader>ae", telescope.extensions.aerial.aerial, {})
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
}
