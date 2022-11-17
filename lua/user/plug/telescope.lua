local function setup()
  require("telescope").setup()

  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }
  local builtin = require("telescope.builtin")
  keymap("n", "<leader>ff", builtin.find_files, opts)
  keymap("n", "<leader>fg", builtin.live_grep, opts)
  keymap("n", "<leader>fb", builtin.buffers, opts)
  keymap("n", "<leader>fh", builtin.help_tags, opts)
end

local plug = {
  "nvim-telescope/telescope.nvim",
  requires = { {"nvim-lua/plenary.nvim"} },
  config = function()
    require("user.plug.telescope").setup()
  end
}

return {
  plug=plug,
  setup=setup,
}
