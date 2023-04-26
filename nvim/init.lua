if vim.g.neovide then 
	vim.o.guifont = "Source Code Pro:h14"
end


-- require("lspconfig").lua_ls.setup {}
-- opt section
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.wo.conceallevel = 1

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.cmd 'set expandtab'
vim.opt.swapfile = false

vim.g.mapleader = " "

-- keybindings section
local bind = vim.keymap
bind.set('n', '<A-f>', ':NvimTreeToggle<CR>')
bind.set('t', '<ESC>', '<C-\\><C-n>', {noremap=true})
bind.set('n', '<A-h>', ':vertical resize -3<CR>', {silent=true})
bind.set('n', '<A-l>', ':vertical resize +3<CR>', {silent=true})
bind.set('n', '<A-k>', ':horizontal resize -3<CR>', {silent=true})
bind.set('n', '<A-j>', ':horizontal resize +3<CR>', {silent=true})
bind.set('v', '<C-w>y', '\"+y')
bind.set('n', '<A-t>', ':ToggleTerm<CR>', {silent=true})
bind.set('t', '<A-t>', '<C-\\><C-n>:ToggleTerm<CR>', {silent=true})
bind.set('n', '<A-i>', ':TableModeToggle<CR>')
bind.set('n', '<A-n>', ':noh<CR>', {silent=true})
bind.set('n', '<Leader>p', ':PencilSoft<CR>')
bind.set('n', '<A-m>', ':tabnew<CR>')
bind.set('n', '<A-a>', ':Telescope aerial<CR>')
bind.set('v', '<C-S-c>', ':"+y<CR>')
-- plugin section
require('plugins')
-- require('lua_ls')
require('gruvbox').setup {
	transparent_mode = true,
}
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
require('lua_line')
require('lsp_config')
require('cmp_completions')
require('tree_sitter')
require('tree')
require('null')
-- require("true-zen.narrow")
require('telescope_plugin')
require("telescope").load_extension "file_browser"
require("start")
require('telescope').load_extension('aerial')

vim.api.nvim_create_autocmd({"VimEnter"}, {
	pattern = "*",
	command = ":PencilSoft",
})

require('neogit').setup {}
