local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed({
	"pyright",
	"clangd",
	"lua_ls",
	"tsserver",
	"ocamllsp",
})
lsp.setup()

local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local sources = {
	null_ls.builtins.diagnostics.flake8.with({
		prefer_local = ".venv/bin",
	}),
	null_ls.builtins.formatting.autopep8.with({
		prefer_local = ".venv/bin",
	}),
	-- null_ls.builtins.diagnostics.mypy.with({
	-- 	prefer_local = ".venv/bin",
	-- }), -- sth wrong with venv stubs
	-- null_ls.builtins.diagnostics.eslint,
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.clang_format,
	null_ls.builtins.formatting.prettier,
}

null_ls.setup({
	sources = sources,
	-- stolen from https://github.com/dreamsofcode-io/neovim-python/blob/main/configs/null-ls.lua
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({
				group = augroup,
				buffer = bufnr,
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
