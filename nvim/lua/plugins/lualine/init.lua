require('lualine').setup {
    options = {
        theme = 'seoul256',
        globalstatus = true,
        disabled_filetypes = { 'NvimTree' },
        ignore_focus = { 'NvimTree' }
    },
    sections = {
        lualine_c = {
            { 'filename', path = 1 }
        },
    }
}
