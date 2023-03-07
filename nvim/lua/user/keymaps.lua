local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap('i', '¿¿', '<esc>', opts)
keymap('n', '<space>e', ':NvimTreeToggle<cr>', opts)
keymap('n', '<space>t', ':Telescope<cr>', opts)

-- TELESCOPE
keymap('n', '<c-_>', ':Telescope current_buffer_fuzzy_find sorting_strategy=ascending<cr>', opts) -- CTRL-/
keymap('n', '<space><cr>', ':Telescope buffers<cr>', opts)

-- Quickfix list
keymap('n', '<space>n', ':cnext<cr>', opts)
keymap('n', '<space>p', ':cprev<cr>', opts)
