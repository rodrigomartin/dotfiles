local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- PLUGINS HERE
packer.startup(function(use)
  -- Plugin manager
  use 'wbthomason/packer.nvim'

  -- Status line
  use 'nvim-lualine/lualine.nvim'

  -- GIT
  use 'tpope/vim-fugitive'

  -- LSP
  use {
      'williamboman/nvim-lsp-installer',
      'neovim/nvim-lspconfig'
  }

  -- Treesitter
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }

  -- File explorer
  use {
      'nvim-telescope/telescope.nvim',
      requires = {
          {'nvim-lua/plenary.nvim'},
          {'BurntSushi/ripgrep'},
          {'sharkdp/fd'},
          {'nvim-treesitter/nvim-treesitter'},
      }
  }
  use {
      'kyazdani42/nvim-tree.lua',
      requires = {
          'kyazdani42/nvim-web-devicons'
      }
  }

  -- Themes
  use 'Mofiqul/vscode.nvim'
  use 'marko-cerovac/material.nvim'

  -- My Plugins
  use '~/dev/vimsql'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
