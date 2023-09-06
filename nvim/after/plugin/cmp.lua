local cmp = require('cmp')
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
    luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
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
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select_opts),
    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select_opts),
  }),
})
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
