local bind = vim.keymap.set

bind("n", "<A-t>", vim.cmd.TroubleToggle)
bind("n", "<leader>rn", vim.lsp.buf.rename)
bind("n", "gD", vim.lsp.buf.declaration)
bind("n", "gd", vim.lsp.buf.definition)
bind("n", "<leader>h", vim.lsp.buf.hover)
bind("n", "<leader>ca", vim.lsp.buf.code_action)
bind("n", "<leader>cd", function()
	vim.cmd.cd({ "%:p:h" })
	vim.cmd.pwd()
end)

bind("n", "<C-c>", '"+y')
bind("v", "<C-c>", '"+y')
bind("t", "<ESC>", "<C-\\><C-n>")

local function toggle_diagnostics()
	if vim.g.diagnostics_visible then
		vim.g.diagnostics_visible = false
		vim.diagnostic.disable()
	else
		vim.g.diagnostics_visible = true
		vim.diagnostic.enable()
	end
end

bind("n", "<leader>d", toggle_diagnostics)

function toggle_hlsearch()
	if vim.opt.hlsearch then
		vim.opt.hlsearch = false
	else
		vim.opt.hlsearch = true
	end
end

bind("n", "<A-n>", toggle_hlsearch)

bind("n", "<leader>pdf", function()
	require("dap").continue()
end)

bind("n", "<leader>pdm", function()
	require("dap").test_method()
end)

bind("n", "<leader>pdc", function()
	require("dap").test_class()
end)

bind("n", "<leader>so", function()
	require("dap").step_over()
end)
bind("n", "<leader>sb", function()
	require("dap").toggle_breakpoint()
end)

bind("n", "<A-h>", ":vertical resize -3<CR>", { silent = true })
bind("n", "<A-l>", ":vertical resize +3<CR>", { silent = true })
bind("n", "<A-k>", ":horizontal resize -3<CR>", { silent = true })
bind("n", "<A-j>", ":horizontal resize +3<CR>", { silent = true })
