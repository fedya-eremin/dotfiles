local M = {}
local bind = vim.keymap.set

M.on_attach = function(_, bufnr)
	local function opts(desc)
		return { buffer = true, desc = "LSP " .. desc }
	end

	bind("n", "K", vim.lsp.buf.hover, opts("View hover docs"))
	bind("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
	bind("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
	bind("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
	bind("n", "go", vim.lsp.buf.type_definition, opts("Go to type_definition"))
	bind("n", "gr", vim.lsp.buf.references, opts("Go to references"))
	bind("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename symbol"))
	bind("n", "<leader>ca", vim.lsp.buf.code_action, opts("View code actions"))
end
-- Close LSP hover windows automatically
-- vim.api.nvim_create_autocmd({ "CursorMoved", "BufHidden", "InsertEnter" }, {
-- 	callback = function()
-- 		for _, win in ipairs(vim.api.nvim_list_wins()) do
-- 			local config = vim.api.nvim_win_get_config(win)
-- 			if config.relative ~= "" then -- this is a floating window
-- 				vim.api.nvim_win_close(win, false)
-- 			end
-- 		end
-- 	end,
-- })

local capabilities = {
	textDocument = {
		foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		},
		hover = {
			border = "single",
			width = 100,
		},
	},
}

M.capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

M.defaults = function()
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			M.on_attach(_, args.buf)
		end,
	})
	if vim.lsp.config then
		vim.lsp.config("*", { capabilities = M.capabilities, root_markers = { ".git" } })
		vim.lsp.config("lua_ls", {
			cmd = { "lua-language-server" },
			filetypes = { "lua" },
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
		vim.lsp.enable("lua_ls")
	end
end

return M
