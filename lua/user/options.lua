local options = {
  termguicolors = true,          -- set term gui colors
--  clipboard = "unnamedplus",      -- allows nvim to access the system clipboard
  smartindent = true,            -- make indenting smarter again
  shiftwidth = 2,                -- number of spaces for each indentation
  tabstop = 2,                   -- 2 spaces for a tab
  expandtab = true,              -- convert tabs to spaces
  mouse     = "a",               -- allow neovim to use the mouse
  -- pumheight = 10                 -- popup menu height
  hlsearch = true,               -- hightlight all matches on previous search patterns
  conceallevel = 0,              -- so that `` is visible in markdown files
  cmdheight = 1,                 -- more space in nvim command line for displaying messages
  cursorline = true,             -- highlight cursor line
  number = true,                 -- show line numbers
}

for k,v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd('colorscheme alduin')

