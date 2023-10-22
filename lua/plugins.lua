return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use "nvim-tree/nvim-tree.lua"

	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-nvim-lsp"
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		requires = { 
			{'nvim-lua/plenary.nvim'},
			{'BurntSushi/ripgrep'}
		}
	}

	use "andweeb/presence.nvim"
end)
