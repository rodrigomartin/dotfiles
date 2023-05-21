local bufferline = require('bufferline')
bufferline.setup{
    options = {
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        indicator = {
            icon = '▎',
            style = 'icon',
        },
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "left",
                separator = true
            }
        },
    }
}
