require("nvim-tree").setup({
	auto_reload_on_write = true,
	sync_root_with_cwd          = true,
	sort_by = "case_sensitive",
	view = {
		width = 30,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
    live_filter = {
        prefix = "filter by: ",
        always_show_folders = false, -- Turn into false from true by default
    }
})

