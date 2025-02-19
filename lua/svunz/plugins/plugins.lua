return {

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' }
    },

    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

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
        },
        opts = {
            window = {
                position = "left",
                width = 50,
            },
        },
    },

    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    { 'sbdchd/neoformat' },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },

    { 'JoosepAlviste/nvim-ts-context-commentstring' },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    },

    { "sindrets/diffview.nvim" },

}
