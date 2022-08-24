local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap('i', 'jj', '<esc>', opts)
keymap('n', '<space>e', ':NvimTreeToggle<cr>', opts)
keymap('n', '<space>t', ':Telescope<cr>', opts)

-- TELESCOPE
keymap('n', '<c-_>', ':Telescope current_buffer_fuzzy_find sorting_strategy=ascending<cr>', opts)
keymap('n', '<space><cr>', ':Telescope buffers<cr>', opts)
