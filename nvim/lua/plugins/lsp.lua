return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			local lspconfig = require("lspconfig")
			local lsp = vim.lsp
			local blink = require("blink.cmp")

			local lsp_attach = function(client, bufnr)
				local opts = { buffer = bufnr }
				vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
				vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
				vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
				vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
				vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
				vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
				vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
				vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
			end

            lsp.on_attach = lsp_attach

			lspconfig.gopls.setup({
				on_attach = lsp.on_attach,
				capabilities = blink.get_lsp_capabilities(),
			})
			lspconfig.zls.setup({
				on_attach = lsp.on_attach,
				capabilities = blink.get_lsp_capabilities(),
			})
			lspconfig.ts_ls.setup({
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = "/usr/lib/node_modules/@vue/typescript-plugin",
							languages = { "vue", "javascript", "typescript" },
						},
					},
				},
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
				on_attach = lsp.on_attach,
				capabilities = blink.get_lsp_capabilities(),
				root_dir = lspconfig.util.root_pattern("package.json"),
				single_file_support = false,
			})
			lspconfig.tailwindcss.setup({
				on_attach = lsp.on_attach,
				capabilities = blink.get_lsp_capabilities(),
				root_dir = lspconfig.util.root_pattern("tailwind.config.js", "tailwind.config.ts", "package.json"),
				single_file_support = false,
			})
			lspconfig.cssls.setup({})

			lspconfig.pyright.setup({
				on_attach = lsp.on_attach,
				filetypes = { "python", "pyrex" },
				capabilities = blink.get_lsp_capabilities(),
				settings = {},
			})

			lspconfig.clangd.setup({
				single_file_support = true,
				on_attach = lsp.on_attach,
				capabilities = blink.get_lsp_capabilities(),
				cmd = { "clangd" },
				root_dir = lspconfig.util.root_pattern(
					".clangd",
					".clang-tidy",
					".clang-format",
					"compile_commands.json",
					"compile_flags.txt",
					"configure.ac",
					".git"
				),
			})
			lspconfig.rust_analyzer.setup({
				on_attach = lsp.on_attach,
				capabilities = blink.get_lsp_capabilities(),
			})
			local configs = require("lspconfig.configs")
			if not configs.tact then
				configs.tact = {
					default_config = {
						cmd = { "tact-language-server", "--stdio" },
						filetypes = { "tact" },
						root_dir = require("lspconfig.util").root_pattern("package.json", ".git"),
					},
				}
			end
			lspconfig.tact.setup({})
			lspconfig.gopls.setup({
				on_attach = lsp.on_attach,
				capabilities = blink.get_lsp_capabilities(),
			})
			lspconfig.dockerls.setup({})
			lspconfig.vacuum.setup({
				filetypes = { "yaml" },
			})

			lspconfig.lua_ls.setup({
				on_attach = lsp.on_attach,
				capabilities = blink.get_lsp_capabilities(),
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
