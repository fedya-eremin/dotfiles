require("lualine").setup({
  options = {
    theme = require("lualine.themes.gruvbox-material"),
    component_separators = "|",
    sections_separators = "|",
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
