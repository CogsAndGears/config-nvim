local fn = vim.fn

-- Automatically install Lazy
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
  {
    -- terminal
    require("user.plug.toggleterm").plug,

    -- syntax highlighting
    require("user.plug.nvim-treesitter").plug,

    -- file browser
    require("user.plug.tree").plug,
    require("user.plug.telescope").plug,

    -- language server
    --use(require("user.plug.coc").plug)
    require("user.plug.mason").plug,

    -- autocomplete
    require("user.plug.nvim-cmp").plug,

    -- debugger
    require("user.plug.nvim-dap-ui").plug,

    -- utility
    --{ "lewis6991/impatient.nvim" },
    
    -- database connectivity
    require("user.plug.vim-dadbod-ui").plug,
  },
  {
    defaults = {
      lazy = false,
    },
  }
)

