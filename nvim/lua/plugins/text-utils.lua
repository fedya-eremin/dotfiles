return {
	{
		"m-demare/hlargs.nvim",
		config = function()
			require("hlargs").setup()
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
			vim.o.foldcolumn = "0"
			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
			vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" }
				end,
			})
		end,
	},
	{ "windwp/nvim-ts-autotag", ft = { "html", "javascriptreact", "typescriptreact" } },
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require("Comment").setup()
		end,
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
	-- {
	-- 	"lervag/vimtex",
	-- 	lazy = false, -- we don't want to lazy load VimTeX
	-- 	-- tag = "v2.15", -- uncomment to pin to a specific release
	-- 	init = function()
	-- 		-- VimTeX configuration goes here, e.g.
	-- 		vim.g.vimtex_view_method = "zathura"
	-- 	end,
	-- },
}
