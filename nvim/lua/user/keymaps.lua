local keymap = vim.api.nvim_set_keymap

keymap('i', 'jj', '<esc>', {noremap=true, silent=true})
keymap('n', '<space>t', ':NvimTreeToggle<cr>', {noremap=true, silent=true})
