return {
  "stevearc/oil.nvim",
  tag = "v2.8.0",
  config = function()
    require("oil").setup({
      columns = {
        "icon",
        "mtime",
      },
    })
  end
}
