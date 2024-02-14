local lsp = require("lsp-zero")
local util = require("lspconfig.util")

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)
lsp.preset("recommended")

lsp.set_sign_icons({
  error = "󰚌",
  warn = "󰸰",
  hint = "󰯞",
  info = "",
})
lsp.ensure_installed({
  -- "pyright",
  "lua_ls",
  "tsserver",
  -- "luaformat", --  TODO find right name
  -- "ocamllsp",
  "tailwindcss",
  "svelte",
  "emmet_ls",
})

lsp.setup()

require("lspconfig").gopls.setup({
  on_attach = lsp.on_attach,
  capabilities = lsp.get_capabilities(),
})

require("lspconfig").clangd.setup({
  single_file_support = true,
  on_attach = lsp.on_attach,
  capabilities = lsp.get_capabilities(),
  cmd = { "clangd" },
  root_dir = require("lspconfig").util.root_pattern(
    ".clangd",
    ".clang-tidy",
    ".clang-format",
    "compile_commands.json",
    "compile_flags.txt",
    "configure.ac",
    ".git"
  ),
})

require("lspconfig").pyright.setup({
  on_attach = lsp.on_attach,
  capabilities = lsp.get_capabilities(),
})

require("lspconfig").ocamllsp.setup({
  on_attach = lsp.on_attach,
  capabilities = lsp.get_capabilities(),
  single_file_support = true,
})

require("lspconfig").lua_ls.setup({
  on_attach = lsp.on_attach,
  capabilities = lsp.get_capabilities(),
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

require("lspconfig").nim_langserver.setup({
  on_attach = lsp.on_attach,
  capabilities = lsp.get_capabilities(),
})

vim.g.rustaceanvim = {
  server = {
    capabilities = lsp.get_capabilities(),
    single_file_support = true,
  },
}
