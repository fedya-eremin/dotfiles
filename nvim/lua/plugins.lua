return {
	"rebelot/kanagawa.nvim",
	{"nvim-treesitter/nvim-treesitter", build = "TSUpdate"},
	{
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  dependencies = {
	    -- LSP Support
	    {'neovim/nvim-lspconfig'},             -- Required
	    {'williamboman/mason.nvim'},           -- Optional
	    {'williamboman/mason-lspconfig.nvim'}, -- Optional

	    -- Autocompletion
	    {'hrsh7th/nvim-cmp'},     -- Required
	    {'hrsh7th/cmp-nvim-lsp'}, -- Required
	    {'L3MON4D3/LuaSnip'},     -- Required
        'hrsh7th/cmp-cmdline'
	  }
	},
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    "nvim-lualine/lualine.nvim",
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
    },
    {
      'mrcjkb/haskell-tools.nvim',
      dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim', -- Optional
      },
      branch = '2.x.x', -- Recommended
      ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
    },
    "mrcjkb/haskell-snippets.nvim"
}
