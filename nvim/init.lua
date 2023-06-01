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
-- bind.set('n', '<A-t>', ':ToggleTerm<CR>', {silent=true})
-- bind.set('t', '<A-t>', '<C-\\><C-n>:ToggleTerm<CR>', {silent=true})
bind.set('n', '<A-i>', ':TableModeToggle<CR>')
bind.set('n', '<A-n>', ':noh<CR>', {silent=true})
bind.set('n', '<Leader>p', ':PencilSoft<CR>')

vim.keymap.set('n', '<A-t>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<A-t>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
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
vim.cmd("colorscheme nordic")
-- vim.o.background = 'dark'
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
require("term")
require('neogit').setup {}
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
-- require('magma_notebook')



local iron = require "iron.core"
iron.setup({
  config = {
    should_map_plug = false,
    scratch_repl = true,
    repl_definition = {
      sh = {
        command = { "fish" }
      },
      python = {
        command = { "ipython" },
        format = require("iron.fts.common").bracketed_paste,
      },
    },
  },
  keymaps = {
    send_motion = "ctr",
    visual_send = "ctr",
  },
  repl_open_cmd = require('iron.view').bottom(40),
})


require('go').setup()
require("go.format").gofmt()  -- goimport + gofmt
-- Run gofmt on save

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').gofmt()
  end,
  group = format_sync_grp,
})

