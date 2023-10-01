local telescope = require("telescope")
local actions = require("telescope.actions")
telescope.setup({
	defaults = {
		initial_mode = "normal",
		layout_config = {
			width = 0.5,
		},
	},
	pickers = {
		find_files = {
			hidden = true,
			cwd = "~",
			previewer = false,
		},
		buffers = {
			mappings = {
				n = {
					["d"] = actions.delete_buffer + actions.move_to_top,
				},
				i = {
					["<C-d>"] = actions.delete_buffer + actions.move_to_top,
				},
			},
			previewer = false,
		},
	},
	extensions = {
		file_browser = {
			use_fd = false,
			previewer = false,
		},
		aerial = {},
	},
})

local builtin = require("telescope.builtin")

telescope.load_extension("file_browser")
telescope.load_extension("fzf")
telescope.load_extension("aerial")
vim.keymap.set("n", "<A-f>", telescope.extensions.file_browser.file_browser, {})
vim.keymap.set("n", "<leader>v", builtin.find_files, {})
vim.keymap.set("n", "<A-v>", function()
	builtin.find_files({ cwd = "." })
end, {})
vim.keymap.set("n", "<A-g>", builtin.git_files, {})
vim.keymap.set("n", "<A-b>", builtin.buffers, {})
vim.keymap.set("n", "<A-J>", builtin.help_tags, {})
vim.keymap.set("n", "<A-a>", telescope.extensions.aerial.aerial, {})
