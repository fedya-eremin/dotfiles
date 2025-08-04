vim.o.termguicolors = true
vim.o.nu = true
vim.o.relativenumber = true
vim.o.guicursor = ""
vim.o.showmode = false

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false

vim.o.wrap = false
vim.o.smartindent = true

vim.o.swapfile = true
vim.o.backup = false
vim.o.undofile = true

vim.opt.iskeyword:append({ "-", "_" })

vim.o.hlsearch = true
vim.o.conceallevel = 0
vim.o.list = true
vim.o.listchars = "space:·,tab:··,lead:·,nbsp:·,trail:·"
vim.o.laststatus = 3

vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "

vim.opt.mouse = ""
vim.opt.scrolloff = 10
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 1
vim.g.netrw_winsize = 25
vim.diagnostic.config({
	virtual_text = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰚌",
			[vim.diagnostic.severity.WARN] = "󰸰",
			[vim.diagnostic.severity.HINT] = "󰯞",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
})
vim.g.diagnostics_visible = true

vim.opt.clipboard = "unnamedplus"
vim.o.winborder = "single"
