local lsp_installer = require('nvim-lsp-installer')
local servers       = {
    'intelephense',
    'sumneko_lua',
    'jedi_language_server',
    'tsserver',
    'yamlls',
    'vimls',
    'dockerls',
}

lsp_installer.setup({ ensure_installed = servers })
