local bind = vim.keymap.set

bind("n", "<A-t>", vim.cmd.TroubleToggle)
bind("n", "<leader>rn", vim.lsp.buf.rename)
-- bind("n", "gD", vim.lsp.buf.declaration)
-- bind("n", "gd", vim.lsp.buf.definition)
-- bind("n", "<leader>h", vim.lsp.buf.hover)
bind("n", "<leader>ca", vim.lsp.buf.code_action)
bind("n", "<leader>cd", function()
	vim.cmd.cd({ "%:p:h" })
	vim.cmd.pwd()
end)
bind("n", "<C-w>a", ":qall<CR>")

bind("n", "<C-c>", '"+y')
bind("v", "<C-c>", '"+y')
bind("t", "<ESC>", "<C-\\><C-n>")
bind("n", "<A-e>", ":lua MiniFiles.open()<CR>", { silent = true })

bind("n", "<Up>", function()
	print("Use k instead")
end)
bind("n", "<Down>", function()
	print("Use j instead")
end)
bind("n", "<Right>", function()
	print("Use l instead")
end)
bind("n", "<Left>", function()
	print("Use h instead")
end)

-- bind("n", "<C-w>a", vim.api.quit)

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

local hlstate = true
local function toggle_hlsearch()
	if hlstate == true then
		vim.opt.hlsearch = false
		hlstate = false
	else
		vim.opt.hlsearch = true
		hlstate = true
	end
end

bind("n", "<A-n>", toggle_hlsearch)

bind("n", "<A-h>", ":vertical resize -3<CR>", { silent = true })
bind("n", "<A-l>", ":vertical resize +3<CR>", { silent = true })
bind("n", "<A-k>", ":horizontal resize -3<CR>", { silent = true })
bind("n", "<A-j>", ":horizontal resize +3<CR>", { silent = true })

bind("n", "<leader>m", "<cmd>lua lsmarks()<CR>")

bind("i", "<A-TAB>", function()
	return vim.fn["codeium#Accept"]()
end, { expr = true })

bind("i", "<A-BS>", function()
	return vim.fn["codeium#Clear"]()
end, { expr = true })

bind("v", "<A-s>", vim.cmd.SnipRun)
