local plug = {
  "nvim-tree/nvim-tree.lua", config = function()
    require("nvim-tree").setup()
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
}

return {
  plug = plug,
  map_keys = map_keys,
}

