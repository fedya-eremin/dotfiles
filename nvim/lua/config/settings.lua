vim.opt.termguicolors = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.guicursor = ""
vim.opt.showmode = false

vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.wrap = false
vim.opt.smartindent = true

vim.opt.swapfile = true
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.iskeyword:append({ "-", "_" })

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
vim.opt.hlsearch = true
vim.opt.conceallevel = 0
vim.opt.list = true
vim.opt.listchars = "space:·,tab:··,lead:·,nbsp:·,trail:·"
vim.opt.laststatus = 3

vim.opt.clipboard = "unnamedplus"

vim.o.winborder = "single"
