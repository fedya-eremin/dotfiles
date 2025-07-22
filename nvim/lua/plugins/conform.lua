return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "golines", "gofumpt" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },

				html = { "djlint" },
			},
			format_after_save = {
				lsp_fallback = false,
			},
		})

		require("conform").formatters.djlint = {
			prepend_args = { "--indent", "2" },
		}

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({
					async = true,
					quiet = true,
					bufnr = args.buf,
				})
			end,
		})
	end,
}
