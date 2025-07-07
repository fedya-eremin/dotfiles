return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			telescope.setup({
				defaults = {
					-- old settings
					-- initial_mode = "normal",
					-- layout_strategy = "bottom_pane",
					-- layout_config = {
					-- 	prompt_position = "bottom",
					-- },
				},
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
			telescope.load_extension("remote-sshfs")
			vim.keymap.set("n", "<leader>v", builtin.find_files, {})
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
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release "
			.. "&& cmake --build build --config Release && cmake --install build --prefix build",
	},
}
