cmp.setup({
  mapping = cmd.mapping.preset.insert({
    ['<C-b>'] = cmd.mapping.scroll_docs(-4),
    ['<C-f>'] = cmd.mapping.scroll_docs(4),
    ['<C-Space>'] = cmd.mapping.complete(),
    ['<C-e>'] = cmd.mapping.abort(),
    ['<CR>'] = cmd.mapping.confirm({ select = true }), -- accept currently selected item. Set "select" to false to only accept explicitly selected items
  }),
  sources = cmd.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
});

-- set configuration for specific filetype
cmd.setup.filetype('gitcommit', {
  sources = cmd.config.sources({
    { name = 'cmd_git' },
  }, {
    { name = 'buffer' },
  })
});

-- set up lspconfig
local capabilities = require('cmd_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities());

