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
bind.set('n', '<A-f>', ':Oil<CR>')
bind.set('t', '<ESC>', '<C-\\><C-n>', {noremap=true})
bind.set('n', '<A-h>', ':vertical resize -3<CR>', {silent=true})
bind.set('n', '<A-l>', ':vertical resize +3<CR>', {silent=true})
bind.set('n', '<A-k>', ':horizontal resize -3<CR>', {silent=true})
bind.set('n', '<A-j>', ':horizontal resize +3<CR>', {silent=true})
bind.set('v', '<C-w>y', '\"+y')
bind.set('n', '<A-i>', ':TableModeToggle<CR>')
bind.set('n', '<A-n>', ':noh<CR>', {silent=true})
bind.set('n', '<Leader>p', ':PencilSoft<CR>')

-- tabs
bind.set('n', '<A-m>', ':tabnew<CR>')
bind.set('n', '<A-.>', ':tabnext<CR>')
bind.set('n', '<A-,>', ':tabprevious<CR>')
bind.set('n', '<A-c>', ':tabclose<CR>')
bind.set('n', '<A-a>', ':Telescope aerial<CR>')

-- copy & paste
bind.set('v', '<C-c>', '"+y<CR>')
bind.set('n', '<C-S-d>d', '"_dd<CR>')
bind.set('v', '<C-S-d>d', '"_dd<CR>')

bind.set('n', '<leader>j', ":Telescope keymaps<CR>")

require('plugins')

-- require('theme')
vim.cmd("colorscheme monochrome")
-- vim.o.background = 'dark'
require('lua_line')
require('lsp_config')
require('cmp_completions')
require('tree_sitter')
require('null')
-- require("true-zen.narrow")
require('telescope_plugin')
require("telescope").load_extension "file_browser"
require("start")
require('telescope').load_extension('aerial')
require('neorg').setup {
    load = {
        ["core.defaults"] = {}
    }
}

require('lab').setup {
  quick_data = {
    enabled = true,
  }
}
require("oil").setup()
require("goplug")
