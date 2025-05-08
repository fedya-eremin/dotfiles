-- Using lazy.nvim
return {
	"rktjmp/lush.nvim",
	{
		dir = "~/dotfiles/nvim/lua/personal/nvim-colors",
		lazy = false,
		config = function()
			vim.cmd("colorscheme nvim-colors")
		end,
	},
}
