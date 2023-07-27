local null_ls_ok, null_ls = pcall(require, "null-ls")
if not null_ls_ok then
  return
end
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local sources = {
  -- python
  null_ls.builtins.formatting.black.with({
    extra_args = { "--line-length=80" }
  }),
 --  null_ls.builtins.diagnostics.flake8.with({
	-- prefer_local = ".venv/bin",
 --  }),
 --  null_ls.builtins.formatting.isort,
}

null_ls.setup({
    sources = sources,
    -- on_attach = function(client, bufnr)
    --     if client.supports_method("textDocument/formatting") then
    --         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    --         vim.api.nvim_create_autocmd("BufWritePre", {
    --             group = augroup,
    --             buffer = bufnr,
    --             callback = function()
    --                 -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
    --                 vim.lsp.buf.format({ async = false })
    --             end,
    --         })
    --     end
    -- end,
})

