local util = require("lspconfig.util")

return {
	default_config = {
		cmd = { "tact-language-server", "--stdio" },
		filetypes = { "tact" },
		root_dir = util.root_pattern("package.json", ".git"),
	},
	docs = {
		description = [[
      Tact Language Server
      https://github.com/tact-lang/tact-language-server
    ]],
		default_config = {
			root_dir = [[root_pattern("package.json", ".git")]],
		},
	},
}
