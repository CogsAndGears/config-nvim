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

