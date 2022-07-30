local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Insert mode maps
keymap("i", "jj", "<ESC>", opts)

-- Windows nav
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Explorer
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader><cr>", ":Telescope buffers<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<cr>", opts)
keymap("n", "<C-Down>", ":resize -2<cr>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<cr>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<cr>", opts)
