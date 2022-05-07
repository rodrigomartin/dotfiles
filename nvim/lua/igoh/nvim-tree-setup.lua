--type ":help nvim-tree" for documentation
require('nvim-tree').setup {
    actions = {
        open_file = {
            quit_on_open = false,
            resize_window = true,
        },
    },
    git = {
        ignore = true,
    },
    view = {
        number = true,
        relativenumber = true,
    },
}
