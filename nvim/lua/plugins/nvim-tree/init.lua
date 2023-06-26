require('nvim-web-devicons').setup {
    override = {
        ['dockerfile'] = {
            icon = '',
            name = 'Dockerfile',
        },
        ['docker-compose.yml'] = {
            icon = '',
            name = 'Dockerfile',
        },
        ['docker-compose.yaml'] = {
            icon = '',
            name = 'Dockerfile',
        },
    },
    default = true,
}

require('nvim-tree').setup {
    actions = {
        open_file = {
            quit_on_open = false,
            resize_window = true,
        },
    },
    update_focused_file = {
        enable = true,
        update_root = false,
        ignore_list = {},
    },
    git = {
        ignore = false,
    },
}
