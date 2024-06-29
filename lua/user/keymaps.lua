-- shorten function name
local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- rename symbol
keymap("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", { noremap = true })

-- copy to clipboard
keymap("v", "<leader>y", "\"+y", { noremap = true })
keymap("v", "<leader>Y", "\"+yg_", { noremap = true })
keymap("n", "<leader>y", "\"+y", { noremap = true })
keymap("n", "<leader>yy", "\"+yy", { noremap = true })

-- Paste from clipboard
keymap("n", "<leader>p", "\"+p", { noremap = true })
keymap("n", "<leader>P", "\"+P", { noremap = true })
keymap("v", "<leader>p", "\"+p", { noremap = true })
keymap("v", "<leader>P", "\"+P", { noremap = true })
