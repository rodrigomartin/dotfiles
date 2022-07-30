require ('plugins.bootstrap')

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- explorer
  use {
	  'kyazdani42/nvim-tree.lua',
	  requires = {
		  'kyazdani42/nvim-web-devicons', -- optional, for file icons
	  },
	  tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- themes
  use 'Mofiqul/vscode.nvim'
end)
