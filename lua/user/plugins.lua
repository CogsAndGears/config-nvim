local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
-- @ diagnostic disable-next-line: missing parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer; close and reopen Neovim"
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  snapshot_path = fn.stdpath "config" .. "/snapshots",
  max_jobs = 50,
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
    prompt_border = "rounded", -- border style of prompt popup
  },
}

local function file_exists(fname)
  local f = io.open(fname, 'r');
  if f ~= nil then io.close(f) return true else return false end
end

-- Install plugins here
return packer.startup(
  {
    function(use)
      -- required so packer recognizes itself
      use("wbthomason/packer.nvim")

      -- terminal
      use(require("user.plug.toggleterm").plug)

      -- syntax highlighting
      use(require("user.plug.nvim-treesitter").plug)

      -- file browser
      use(require("user.plug.tree").plug)

      -- language server
      --use(require("user.plug.coc").plug)
      use(require("user.plug.mason").plug)

      -- autocomplete
      use(require("user.plug.nvim-cmp").plug)

      -- debugger
      use(require("user.plug.nvim-dap-ui").plug) 

      -- utility
      use("lewis6991/impatient.nvim")

      -- recreate your configuration if the packer_compiled.lua script has not yet been created
      local compiled_path = vim.fn.stdpath('config')..'/plugin/packer_compiled.lua'
      local compiled_exists = file_exists(compiled_path)

      -- automatically set your configuration after cloning packer.nvim
      -- put this at the end after all plugins
      if PACKER_BOOTSTRAP or not compiled_exists then
        require("packer").sync()
      end
    end,
    config = {
      snapshot='20221018',
    }
  }
)

