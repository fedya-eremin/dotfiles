local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed({
	"pyright",
	"clangd",
	"lua_ls",
	"hls",
})
lsp.on_attach = function(client, bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    lsp.default_keymaps({buffer = bufnr})
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
end

lsp.skip_server_setup({'hls'})
lsp.setup()
