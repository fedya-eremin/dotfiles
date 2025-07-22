require("config.lib.lspconfig").defaults()

vim.lsp.config("gopls", {
	cmd = { "gopls" },
	filetypes = { "go", "gomod" },
	root_markers = { "go.mod" },
})

vim.lsp.enable("gopls")

vim.lsp.config("ts_ls", {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	root_markers = { "package.json" },
})

vim.lsp.enable("ts_ls")
