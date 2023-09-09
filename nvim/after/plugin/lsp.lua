local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed({
	"pyright",
	"clangd",
	"lua_ls",
	"hls",
	"tsserver",
})
lsp.on_attach = function(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	if client.resolved_capabilities.code_lens then
		local codelens = vim.api.nvim_create_augroup("LSPCodeLens", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "CursorHold" }, {
			group = codelens,
			callback = function()
				vim.lsp.codelens.refresh()
			end,
			buffer = bufnr,
		})
	end
end

lsp.skip_server_setup({ "hls" })
lsp.setup()

local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local sources = {
	null_ls.builtins.diagnostics.flake8.with({
		prefer_local = ".venv/bin",
	}),
	null_ls.builtins.formatting.autopep8,
	-- null_ls.builtins.diagnostics.mypy, -- sth wrong with venv stubs
	null_ls.builtins.diagnostics.eslint,
	null_ls.builtins.formatting.stylua,
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
