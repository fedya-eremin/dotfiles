local telescope = require("telescope")
local fb_actions = require("telescope._extensions.file_browser.actions")

telescope.setup({
	defaults = {
		initial_mode = "normal",
	},
	pickers = {
		find_files = {
			hidden = true,
			cwd = "~",
		},
	},
	extensions = {
		file_browser = {
			use_fd = false,
		},
	},
})

local builtin = require("telescope.builtin")

telescope.load_extension("file_browser")
telescope.load_extension("fzf")
vim.keymap.set("n", "<A-f>", telescope.extensions.file_browser.file_browser, {})
vim.keymap.set("n", "<A-v>", builtin.find_files, {})
vim.keymap.set("n", "<A-g>", builtin.git_files, {})
vim.keymap.set("n", "<A-b>", builtin.buffers, {})
vim.keymap.set("n", "<A-J>", builtin.help_tags, {})
