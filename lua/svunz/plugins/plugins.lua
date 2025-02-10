
return {

	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	}, 

	{ 
		"rose-pine/neovim", 
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end
	},

	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

	{ 'nvim-treesitter/playground' },

	{ 'ThePrimeagen/harpoon' },

	{ 'mbbill/undotree' },

	{'neovim/nvim-lspconfig'},
	{'hrsh7th/nvim-cmp'},
	{'hrsh7th/cmp-nvim-lsp'},

	{
		{ "williamboman/mason.nvim", opts = { ensure_installed = 'prettier' } },
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}
}
