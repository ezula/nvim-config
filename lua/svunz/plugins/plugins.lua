return {

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' }
    },

    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

    { 'nvim-treesitter/playground' },

    { 'ThePrimeagen/harpoon' },

    { 'mbbill/undotree' },

    { 'neovim/nvim-lspconfig' },

    { 'hrsh7th/nvim-cmp' },

    { 'hrsh7th/cmp-nvim-lsp' },

    {
        { "williamboman/mason.nvim", opts = { ensure_installed = 'prettier' } },
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        }
    },

    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    { 'sbdchd/neoformat' },
}

