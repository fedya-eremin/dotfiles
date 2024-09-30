return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {}, -- this is equalent to setup({}) function
  config = function()
    local npairs = require("nvim-autopairs")
    npairs.setup({
      map_cr = true,
      check_ts = true,
      ts_config = {
        python = false, -- don't check treesitter on python
      },
    })
  end
}
