local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
    vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- git
    use 'tpope/vim-fugitive'

    -- lsp
    use {
        "williamboman/nvim-lsp-installer",
        "neovim/nvim-lspconfig",
    }

    -- Status line
    use 'nvim-lualine/lualine.nvim'

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'BurntSushi/ripgrep' },
            { 'sharkdp/fd' },
            { 'nvim-treesitter/nvim-treesitter' },
        }
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
