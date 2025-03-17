return {
	"my/settings",
	dev = true,
	priority = 9999,
	config = function()
		vim.opt.nu = true
		vim.opt.relativenumber = true
		vim.opt.guicursor = ""
		vim.opt.showmode = false

		vim.opt.tabstop = 4
		vim.opt.softtabstop = 4
		vim.opt.shiftwidth = 4
		vim.opt.expandtab = true

		vim.opt.wrap = false
		vim.opt.smartindent = true

		vim.opt.swapfile = true
		vim.opt.backup = false
		vim.opt.undofile = true

		vim.opt.iskeyword:append({ "-" })

		vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
		vim.g.mapleader = " "

		vim.opt.mouse = ""
		vim.opt.scrolloff = 10
		vim.g.netrw_browse_split = 0
		vim.g.netrw_banner = 0
		vim.g.netrw_winsize = 25
		vim.diagnostic.config({
			virtual_text = false,
		})
		vim.opt.hlsearch = true
		vim.opt.conceallevel = 0
		vim.opt.list = true
		vim.opt.listchars = "space:·,tab:··,lead:·,nbsp:·,trail:·"
		vim.g.codeium_disable_bindings = 1
		vim.opt.laststatus = 3

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "single",
			width = 100,
		})
		-- vim.opt.clipboard = "unnamedplus"
	end,
}
