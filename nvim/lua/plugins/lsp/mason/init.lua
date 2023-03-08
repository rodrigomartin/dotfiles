require('mason').setup()

local mason_lspconfig = require('mason-lspconfig')
local servers         = {
    --'phpactor',
    'lua_ls',
    'jedi_language_server',
    'tsserver',
    'yamlls',
    'vimls',
    'dockerls',
}

mason_lspconfig.setup({ ensure_installed = servers })
