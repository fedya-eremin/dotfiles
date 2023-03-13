require("lspconfig").lua_ls.setup {}
-- opt section
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.wo.conceallevel = 1

vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.swapfile = false

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


