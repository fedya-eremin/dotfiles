return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v4.x",
		lazy = true,
		config = false,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			local lsp = require("lsp-zero")

			local lsp_attach = function(client, bufnr)
				local opts = { buffer = bufnr }

				vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
				vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
				vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
				vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
				vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
				vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
				vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
				vim.keymap.set("n", "rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
				vim.keymap.set("n", "ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
			end
			lsp.extend_lspconfig({
				sign_text = true,
				lsp_attach = lsp_attach,
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})
			lsp.set_sign_icons({
				error = "󰚌",
				warn = "󰸰",
				hint = "󰯞",
				info = "",
			})

			lsp.setup()

			require("lspconfig").gopls.setup({
				on_attach = lsp.on_attach,
				capabilities = lsp.get_capabilities(),
			})
			require("lspconfig").zls.setup({
				on_attach = lsp.on_attach,
				capabilities = lsp.get_capabilities(),
			})
			require("lspconfig").ts_ls.setup({
				on_attach = lsp.on_attach,
				capabilities = lsp.get_capabilities(),
				root_dir = require("lspconfig").util.root_pattern("package.json"),
				single_file_support = false,
			})
			require("lspconfig").tailwindcss.setup({
				on_attach = lsp.on_attach,
				capabilities = lsp.get_capabilities(),
				root_dir = require("lspconfig").util.root_pattern("tailwind.config.js"),
				single_file_support = false,
			})

			require("lspconfig").html.setup({
				filetypes = { "html", "htmldjango" },
			})

			require("lspconfig").pyright.setup({
				on_attach = lsp.on_attach,
				capabilities = lsp.get_capabilities(),
				settings = {},
			})

			require("lspconfig").clangd.setup({
				single_file_support = true,
				on_attach = lsp.on_attach,
				capabilities = lsp.get_capabilities(),
				cmd = { "clangd" },
				root_dir = require("lspconfig").util.root_pattern(
					".clangd",
					".clang-tidy",
					".clang-format",
					"compile_commands.json",
					"compile_flags.txt",
					"configure.ac",
					".git"
				),
			})
			require("lspconfig").rust_analyzer.setup({
				on_attach = lsp.on_attach,
				capabilities = lsp.get_capabilities(),
			})
			require("lspconfig").gopls.setup({
				on_attach = lsp.on_attach,
				capabilities = lsp.get_capabilities(),
			})

			require("lspconfig").lua_ls.setup({
				on_attach = lsp.on_attach,
				capabilities = lsp.get_capabilities(),
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
		end,
	},
}
