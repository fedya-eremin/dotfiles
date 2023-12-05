require("lualine").setup({
  options = {
    theme = require("lualine.themes.iceberg_dark"),
  },
  sections = {
    lualine_x = { "aerial" },
    lualine_b = {
      {
        "diagnostics",
        symbols = {
          error = "󰚌 ",
          warn = "󰸰 ",
          hint = "󰯞 ",
          info = " ",
        },
      },
    },
  },
})
