return {
	"arsham/listish.nvim",
	dependencies = {
		"arsham/arshlib.nvim",
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = {
		theme_list = true,
		clearqflist = "Clearquickfix", -- command
		clearloclist = "Clearloclist", -- command
		clear_notes = "ClearListNotes", -- command
		lists_close = "<leader>cc", -- closes both qf/local lists
		in_list_dd = "dd", -- delete current item in the list
		signs = { -- show signs on the signcolumn
			loclist = "", -- the icon/sigil/sign on the signcolumn
			qflist = "", -- the icon/sigil/sign on the signcolumn
			priority = 10,
		},
		extmarks = { -- annotate with extmarks
			loclist_text = "loclist Note",
			qflist_text = "Quickfix Note",
		},
		quickfix = {
			open = "<leader>qo",
			on_cursor = "<leader>qq", -- add current position to the list
			add_note = "<leader>qn", -- add current position with your note to the list
			clear = "<leader>qd", -- clear all items
			close = "<leader>qc",
			next = "]q",
			prev = "[q",
		},
		loclist = {
			open = "<leader>wo",
			on_cursor = "<leader>ww",
			add_note = "<leader>wn",
			clear = "<leader>wd",
			close = "<leader>wc",
			next = "]w",
			prev = "[w",
		},
	},
}
