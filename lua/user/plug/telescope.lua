local function nvimtree_root()
  local ok, core = pcall(require, "nvim-tree.core")
  if ok and core.get_cwd then
    return core.get_cwd()
  end
end

local function setup()
  require("telescope").setup()

  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }
  local builtin = require("telescope.builtin")
  keymap("n", "<leader>ff", function() builtin.find_files({ cwd = nvimtree_root() }) end, opts)
  keymap("n", "<leader>fg", function() builtin.live_grep({ cwd = nvimtree_root() }) end, opts)
  keymap("n", "<leader>fb", builtin.buffers, opts)
  keymap("n", "<leader>fh", builtin.help_tags, opts)
end

local plug = {
  "nvim-telescope/telescope.nvim",
  dependencies = { {"nvim-lua/plenary.nvim"} },
  config = function()
    require("user.plug.telescope").setup()
  end
}

return {
  plug=plug,
  setup=setup,
}
