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
  },
  config = function ()
    require("user.plug.nvim-cmp-extra").setup()
  end,
}

return {
  plug = plug,
}
