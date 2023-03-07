local lsp_installer = require('nvim-lsp-installer')
local servers       = {
    --'phpactor',
    --'lua_ls',
    'jedi_language_server',
    'tsserver',
    'yamlls',
    'vimls',
    'dockerls',
}

lsp_installer.setup({ ensure_installed = servers })
