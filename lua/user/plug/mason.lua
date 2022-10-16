-- LSP Server package manager
local plug = {
  "williamboman/mason.nvim",
  requires = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function ()
    require("user.plug.mason-extra").setup()
  end,
}

return {
  plug = plug,
}
