return {
  "zenbones-theme/zenbones.nvim",
  dependencies = {
    "rktjmp/lush.nvim",
  },
  config = function()
    vim.cmd("colorscheme kanagawabones")
    vim.cmd("set termguicolors")
    vim.cmd("set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:block25-Cursor/lCursor,r-cr:hor20,o:hor50")
    vim.cmd("hi Cursor guifg=#e0c6af guibg=#e0c6af")
    vim.opt.cursorline = true
    vim.opt.cursorlineopt = "number"
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#333333" })
  end
}
