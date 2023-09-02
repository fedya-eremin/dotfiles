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

-- IDK WHAT IT DOES
-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/guides/quick-recipes.md#setup-with-haskell-tools
local haskell_tools = require('haskell-tools')
local hls_lsp = require('lsp-zero').build_options('hls', {})

local hls_config = {
  hls = {
    capabilities = hls_lsp.capabilities,
    on_attach = function(client, bufnr)
      local opts = {buffer = bufnr}

      -- haskell-language-server relies heavily on codeLenses,
      -- so auto-refresh (see advanced configuration) is enabled by default
      vim.keymap.set('n', '<leader>ca', vim.lsp.codelens.run, opts)
      vim.keymap.set('n', '<leader>hs', haskell_tools.hoogle.hoogle_signature, opts)
      vim.keymap.set('n', '<leader>ea', haskell_tools.lsp.buf_eval_all, opts)
    end
  }
}

-- Autocmd that will actually be in charging of starting hls
local hls_augroup = vim.api.nvim_create_augroup('haskell-lsp', {clear = true})
vim.api.nvim_create_autocmd('FileType', {
  group = hls_augroup,
  pattern = {'haskell'},
  callback = function()
    haskell_tools.start_or_attach(hls_config)

    ---
    -- Suggested keymaps that do not depend on haskell-language-server:
    ---

    -- Toggle a GHCi repl for the current package
    vim.keymap.set('n', '<leader>rr', haskell_tools.repl.toggle, opts)

    -- Toggle a GHCi repl for the current buffer
    vim.keymap.set('n', '<leader>rf', function()
      haskell_tools.repl.toggle(vim.api.nvim_buf_get_name(0))
    end, def_opts)

    vim.keymap.set('n', '<leader>rq', haskell_tools.repl.quit, opts)
  end
})






local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
    {name = 'cmp_luasnip'},
    {name = 'buffer'},
    option = {
        get_bufnrs = function()
            local bufs = {}
            for _, win in ipairs(vim.api.nvim_list_wins()) do
                bufs[vim.api.nvim_win_get_buf(win)] = true
            end
            return vim.tbl_keys(bufs)
        end
    }
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select_opts),
    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select_opts),
  }
})


