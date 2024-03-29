local function setup()
  require("nvim-tree").setup({
    git = {
      enable = true,
      ignore = false,
      timeout = 500,
    },
    view = {
      number = true,
      relativenumber = true,
      adaptive_size = true,
    },
    filters = {
      custom = {
        "^.git$",
        "^__pycache__$",
        "^.pytest_cache$",
      },
    },
  })
  --{
  --  disable_netrw = true,
  --  hijack_netrw = true,
  --  view = {
  --    number = true,
  --    relativenumber = true,
  --  },
  --  filters = {
  --    custom = { ".git" },
  --  },
  --})
  
  local keymap = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }
  keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
end

local plug = {
  "nvim-tree/nvim-tree.lua", config = function()
    require("user.plug.tree").setup()
  end,
  lazy = false,
}

return {
  plug = plug,
  setup = setup,
}

