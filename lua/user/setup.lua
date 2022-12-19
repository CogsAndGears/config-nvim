vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.ignorecase = true

local status_ok, impatient = pcall(require, "impatient")
if status_ok then
  impatient.enable_profile()
end

-- configure LSP support paths
-- python
PYTHON_PATH = os.getenv("MY_NVIM_SUPPORT_PYTHON") .. "/bin/python"
vim.g.python3_host_prog = PYTHON_PATH
