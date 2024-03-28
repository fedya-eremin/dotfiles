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
  "lua_ls",
  "tsserver",
  -- "luaformat", --  TODO find right name
  -- "tailwindcss",
  -- "svelte",
  "emmet_ls",
})

lsp.setup()

require("lspconfig").gopls.setup({
  on_attach = lsp.on_attach,
  capabilities = lsp.get_capabilities(),
})

require("lspconfig").pylsp.setup({
  on_attach = lsp.on_attach,
  capabilities = lsp.get_capabilities(),
  settings = {
    pylsp = {
      plugins = {
        pyflakes = { enabled = false },
        pylint = { enabled = false },
        pycodestyle = { enabled = false },
      },
    },
  },
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

require("lspconfig").sqls.setup({
  on_attach = function(client, bufnr)
    require("sqls").on_attach(client, bufnr) -- require sqls.nvim
  end,
  settings = {
    sqls = {
      connections = {
        {
          driver = "postgresql",
          dataSourceName = "host=127.0.0.1 port=54321 user=admin password=admin dbname=admin sslmode=disable",
        },
      },
    },
  },
})
vim.g.rustaceanvim = {
  server = {
    capabilities = lsp.get_capabilities(),
    single_file_support = true,
  },
}
