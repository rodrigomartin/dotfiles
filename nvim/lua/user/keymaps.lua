local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap('i', 'ññ', '<esc>', opts)
keymap('n', '<space>e', ':NvimTreeToggle<cr>', opts)
keymap('n', '<space>t', ':Telescope<cr>', opts)
keymap('n', '<c-p>', ':Telescope git_files<cr>', opts)
keymap('n', '<c-s>', ':w<cr>', opts)

-- TELESCOPE
keymap('n', '<c-_>', ':Telescope current_buffer_fuzzy_find sorting_strategy=ascending<cr>', opts) -- CTRL-/
keymap('n', '<space><cr>', ':Telescope buffers<cr>', opts)

-- Quickfix list
keymap('n', '<space>n', ':cnext<cr>', opts)
keymap('n', '<space>p', ':cprev<cr>', opts)

-- Bufferline navigation
keymap('n', 'L', ':BufferLineCycleNext<cr>', opts)
keymap('n', 'H', ':BufferLineCyclePrev<cr>', opts)
keymap('n', '<c-x>', ':Bdelete! %<cr>', opts)
