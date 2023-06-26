local bufferline = require('bufferline')
bufferline.setup{
    options = {
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        indicator = {
            icon = '▎',
            style = 'icon',
        },
        custom_filter = function(buf_number, _)
            if vim.bo[buf_number].filetype ~= "fugitive" then
                return true
            end
        end,
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
