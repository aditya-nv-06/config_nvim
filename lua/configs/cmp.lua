local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      -- Uncomment the snippet engine you use:
       require('luasnip').lsp_expand(args.body) -- For LuaSnip users
       vim.fn["vsnip#anonymous"](args.body)       -- For vsnip users

    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'luasnip' }, -- Uncomment if using LuaSnip
    { name = 'vsnip' },   -- Uncomment if using vsnip
  })
})

