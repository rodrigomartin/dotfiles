local lsp_installer = require('nvim-lsp-installer')
local serverlist = require('plugins.lsp.serverlist')

lsp_installer.setup({ ensure_installed = serverlist })
