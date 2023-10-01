local npairs = require("nvim-autopairs")
npairs.setup({
	map_cr = true,
	check_ts = true,
	ts_config = {
		python = false, -- don't check treesitter on python
	},
})
