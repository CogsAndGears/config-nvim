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

-- Install plugins here
return packer.startup(function(use)
  -- required so packer recognizes itself
  use("wbthomason/packer.nvim")

  -- terminal
  use { "akinsho/toggleterm.nvim", tag = "2.3.0", config = function()
    require("toggleterm").setup{
      open_mapping = [[<c-\>]],
    }
  end}

  -- syntax highlighting
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

  -- file browser
  use{"kyazdani42/nvim-tree.lua", config = function()
    require("nvim-tree").setup()
  end}

  -- language server
  use { "neoclide/coc.nvim", branch = "release" }

  -- debugger
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" }, config = function ()
    require("dapui").setup({
      icons = { expanded = "", collapsed = "", current_frame = "" },
      mappings = {
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
      },
      expand_lines = vim.fn.has("nvim-0.7"),
      layouts = {
        {
          elements = {
            { id = "scopes", size = "0.25" },
            "breakpoints",
            "stacks",
            "watches",
          },
          size = 40, -- 40 columns
          position = "left",
        },
        {
          elements = {
            "repl",
            "console",
          },
          size = 0.25, -- 25% of total lines
          position = "bottom",
        },
      },
      controls = {
        element = "repl",
        icons = {
          pause = "",
          play = "",
          step_into = "",
          step_over = "",
          step_out = "",
          step_back = "",
          run_last = "↻",
          terminate = "□",
        },
      },
      floating = {
        max_height = nil,
        max_width = nil,
        border = "single",
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
      windows = { indent = 1 },
      render = {
        max_type_length = nil,
        max_value_lines = 100,
      },
    })
  end}

  -- utility
  use("lewis6991/impatient.nvim")

  -- automatically set your configuration after cloning packer.nvim
  -- put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

