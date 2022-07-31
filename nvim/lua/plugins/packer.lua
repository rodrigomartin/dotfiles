local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- lsp
    use {
        "williamboman/nvim-lsp-installer",
        "neovim/nvim-lspconfig",
    }

    -- explorer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        }
    }

    -- themes
    use 'Mofiqul/vscode.nvim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
