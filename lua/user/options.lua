local options = {
  termguicolors = true,          -- set term gui colors
--  clipboard = "unnamedplus",      -- allows nvim to access the system clipboard
  smartindent = true,            -- make indenting smarter again
  shiftwidth = 2,                -- number of spaces for each indentation
  tabstop = 2,                   -- 2 spaces for a tab
  expandtab = true,              -- convert tabs to spaces
  mouse     = "a",               -- allow neovim to use the mouse
  -- pumheight = 10                 -- popup menu height
  hlsearch = true,               -- highlight all matches on previous search patterns
  conceallevel = 0,              -- so that `` is visible in markdown files
  cmdheight = 1,                 -- more space in nvim command line for displaying messages
  cursorline = true,             -- highlight cursor line
  number = true,                 -- show line numbers
  list = true,                   -- turn on list mode to show whitespace
  --listchars = 'tab:>- ,trail:x,extends:>,precedes:<,nbsp:+,leadmultispace:.',
  listchars = 'nbsp:+,lead:.,trail:x,tab:<=>,multispace:.',
  colorcolumn = "100",
}

for k,v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd('colorscheme alduin')

-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even with only one match
-- noinsert: do not insert text until a selection is made
-- noselect: do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for cursorhold
vim.opt.completeopt = { 'menuone' }

-- Fixed column for diagnostics to appear
-- show autodiagnostic popup on cursor hover_range
-- goto previous / next diagnostic warning / error
-- show inlay hints more frequently
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
