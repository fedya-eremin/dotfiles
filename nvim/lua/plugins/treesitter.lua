return {
  "nvim-treesitter/nvim-treesitter",
  cmd = "TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "c", "python", "javascript", "html", "lua", "vim", "query", "org" },
      sync_install = false,

      auto_install = true,

      ignore_install = { "javascript" },

      highlight = {
        enable = true,

        additional_vim_regex_highlighting = true,
      },
      indent = {
        enable = true,
        disable = { "javascript", "html", "norg", "ocaml" },
      },
      autotag = {
        enable = true,
        disable = { "norg" },
      },
    })
  end
}
