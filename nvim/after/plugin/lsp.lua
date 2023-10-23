local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.set_sign_icons({
	error = "󰚌",
	warn = "󰸰",
	hint = "󰯞",
	info = "",
})
lsp.ensure_installed({
	"pyright",
	"clangd",
	"lua_ls",
	"tsserver",
	"ocamllsp",
	-- "eslint",
	"tailwindcss",
	"svelte",
	"rust_analyzer",
	"emmet_ls",
})
lsp.setup()
