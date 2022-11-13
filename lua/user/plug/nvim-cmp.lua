local function setup()
  local cmp = require("cmp")
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- accept currently selected item. Set "select" to false to only accept explicitly selected items
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
    }, {
      { name = 'buffer' },
    })
  });

  -- set configuration for specific filetype
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' },
    }, {
      { name = 'buffer' },
    })
  });

  -- set up lspconfig
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities());
end

local plug = {
  "hrsh7th/nvim-cmp",
  requires = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    --"quangnguyen30192/cmp-nvim-ultisnips",
    --"hrsh7th/cmp-nvim-lua",
    --"octaltree/cmp-look",
    --"hrsh7th/cmp-path",
    --"hrsh7th/cmp-calc",
    --"f3fora/cmp-spell",
    --"hrsh7th/cmp-emoji",

    -- snippet engine
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
  },
  config = function ()
    require("user.plug.nvim-cmp").setup()
  end,
}

return {
  plug = plug,
  setup = setup,
}
