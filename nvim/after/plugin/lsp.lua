local lsp = require("lsp-zero")

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
  -- "ocamllsp",
  "tailwindcss",
  "svelte",
  "rust_analyzer",
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

require("lspconfig").ocamllsp.setup({
  on_attach = lsp.on_attach,
  capabilities = lsp.get_capabilities(),
  single_file_support = true,
})

require("lspconfig").rust_analyzer.setup({
  on_attach = lsp.on_attach,
  capabilities = lsp.get_capabilities(),
})

vim.g.haskell_tools = {
  hls = {
    capabilities = lsp.get_capabilities(),
  },
}

-- Autocmd that will actually be in charging of starting hls
local hls_augroup = vim.api.nvim_create_augroup("haskell-lsp", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = hls_augroup,
  pattern = { "haskell" },
  callback = function()
    ---
    -- Suggested keymaps from the quick setup section:
    -- https://github.com/mrcjkb/haskell-tools.nvim#quick-setup
    ---

    local ht = require("haskell-tools")
    local bufnr = vim.api.nvim_get_current_buf()
    local def_opts = { noremap = true, silent = true, buffer = bufnr }
    -- haskell-language-server relies heavily on codeLenses,
    -- so auto-refresh (see advanced configuration) is enabled by default
    vim.keymap.set("n", "<space>ca", vim.lsp.codelens.run, opts)
    -- Hoogle search for the type signature of the definition under the cursor
    vim.keymap.set("n", "<space>hs", ht.hoogle.hoogle_signature, opts)
    -- Evaluate all code snippets
    vim.keymap.set("n", "<space>ea", ht.lsp.buf_eval_all, opts)
    -- Toggle a GHCi repl for the current package
    vim.keymap.set("n", "<leader>rr", ht.repl.toggle, opts)
    -- Toggle a GHCi repl for the current buffer
    vim.keymap.set("n", "<leader>rf", function()
      ht.repl.toggle(vim.api.nvim_buf_get_name(0))
    end, def_opts)
    vim.keymap.set("n", "<leader>rq", ht.repl.quit, opts)
  end,
})
