return {
	"nvim-treesitter/nvim-treesitter",
	cmd = "TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			playground = { enable = true },
			sync_install = false,

			highlight = {
				enable = true,

				additional_vim_regex_highlighting = true,
			},
			indent = {
				enable = true,
				disable = { "javascript", "html", "norg", "ocaml" },
			},
		})
	end,
}
