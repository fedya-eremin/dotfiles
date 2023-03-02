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
bind.set('n', '<A-f>', ':CHADopen<CR>')


-- plugin section
require('plugins')


-- configure Mason - a LSP installer

-- require('lua_ls')

require('lua_line')
require('lsp_config')
require('cmp_completions')
