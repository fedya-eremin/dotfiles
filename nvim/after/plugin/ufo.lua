vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.foldcolumn = "0"
-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
require("ufo").setup({
  ft_ignore = {
    "org",
  },
  provider_selector = function(bufnr, filetype, buftype)
    return { "treesitter", "indent" }
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "org" },
  callback = function()
    require("ufo").detach()
    vim.opt_local.foldenable = false
  end
})
