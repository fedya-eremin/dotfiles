local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.flake8.with({
			prefer_local = ".venv/bin",
		}),
		null_ls.builtins.formatting.black,
    },
})
