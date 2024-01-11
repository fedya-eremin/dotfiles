vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.guicursor = ""

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = false
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.laststatus = 3

vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.mouse = ""
vim.opt.scrolloff = 10

vim.diagnostic.config({
	virtual_text = false,
})
vim.opt.hlsearch = false
vim.opt.conceallevel = 2
vim.opt.list = true
vim.opt.listchars = "space:·,tab:··,lead:·,nbsp:·,trail:·"

vim.g.codeium_disable_bindings = 1
