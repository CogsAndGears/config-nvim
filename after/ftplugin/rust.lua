local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
  "n",
  "<leader>a",
  function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end,
  { silent = true, buffer = bufnr }
)
vim.keymap.set(
  "n",
  "K",  -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp({'hover', 'actions'})
  end,
  { silent = true, buffer = bufnr }
)


-- mappings
-- see `:help vim.lsp.*` for documentation
-- settings from here: https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
local bufopts = { noremap=true, silent=true, buffer=bufnr }
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, bufopts)
--vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
--vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
--vim.keymap.set('n', '<space>wl', function()
--  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--end, bufopts)
--vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
--vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
--vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
-- Pop open diagnostics window for LSP errors
vim.keymap.set('n', '<C-k>', vim.diagnostic.open_float, bufopts)
