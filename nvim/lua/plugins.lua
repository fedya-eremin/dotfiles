return {
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = {
			"rktjmp/lush.nvim",
		},
	},
	{ "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate" },
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{
				"L3MON4D3/LuaSnip",
				-- follow latest release.
				version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
				-- install jsregexp (optional!).
				build = "make install_jsregexp",
			}, -- Required
			"hrsh7th/cmp-cmdline",
		},
	},
	"saadparwaiz1/cmp_luasnip",
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	"nvim-lualine/lualine.nvim",
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		-- or, branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release "
			.. "&& cmake --build build --config Release && cmake --install build --prefix build",
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
	},
	{
		"numToStr/Comment.nvim",
		lazy = false,
	},
	{ "windwp/nvim-ts-autotag", ft = { "html", "javascriptreact", "typescriptreact" } },
	{ "MaxMEllon/vim-jsx-pretty", ft = { "javascriptreact", "typescriptreact" } },
	{
		"ellisonleao/glow.nvim",
		config = true,
		cmd = "Glow",
		ft = { "markdown" },
	},
	{
		"stevearc/aerial.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("aerial").setup()
		end,
	},
	{
		"m-demare/hlargs.nvim",
		config = function()
			require("hlargs").setup()
		end,
	},
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true,
		version = "*",
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^3", -- Recommended
		ft = { "rust" },
	},
	{ "ixru/nvim-markdown", ft = { "markdown" } },
	{
		"folke/neodev.nvim",
		opts = {},
		ft = { "lua" },
	},
	{ "stevearc/oil.nvim", tag = "v2.8.0" },
	{ "nanotee/sqls.nvim", ft = { "sql", "pgsql" } },
	{ "nvim-orgmode/orgmode", ft = { "org" }, event = "VeryLazy" },
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	{ "gennaro-tedesco/nvim-peekup" },
}
