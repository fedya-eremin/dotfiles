local cmp = require('cmp')

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
	mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
	  ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
      { name = 'nvim_lsp' },
	  { name = 'luasnip' },
  	}, {
      { name = 'buffer' },
    }, {
      { name = 'lab.quick_data', keyword_length = 4 }
    })
})
