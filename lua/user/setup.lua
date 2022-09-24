vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

local status_ok, impatient = pcall(require, "impatient")
if status_ok then
  impatient.enable_profile()
end

require("nvim-tree").setup()

-- configure CoC support paths
-- python
vim.g.python3_host_prog = "/home/cogs/.app/neovim-support/py3/env/bin/python"

