-- This plugin is powerful but doesn't seem to support obsidian-style wiki links,
-- instead searching for sections in files (rather than filenames themselves)

local function setup()
  require("mkdnflow").setup({
    links = {
      style = "wiki",
    },
    path_resolution = {
      primary = "root",
      fallback = "current",
      root_marker = ".git",
    },
  })
end

local plug = {
  "jakewvincent/mkdnflow.nvim",
  config = function()
    require("user.plug.mkdnflow").setup()
  end
}

return {
  plug = plug,
  setup = setup,
}
