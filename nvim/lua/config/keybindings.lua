local bind = vim.keymap.set
local fns = require("config.lib.functions")

bind("n", "<leader>cd", function()
	vim.cmd.cd({ "%:p:h" })
	vim.cmd.pwd()
end)

bind("t", "<ESC>", "<C-\\><C-n>")
bind("n", "<A-e>", function()
	fns.close_floating_windows()
	vim.cmd("Oil")
end, { silent = true })

bind("n", "<C-u>", "<C-u>zz")
bind("n", "<C-d>", "<C-d>zz")

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
bind("n", "<ESC>", function()
	print("Use C-c instead")
end)

bind("i", "<C-c>", "<ESC>", { remap = true })

bind("n", "<leader>d", fns.toggle_diagnostics)

bind("n", "<A-n>", "<cmd>set hlsearch!<cr>")
bind("n", "<leader>qa", fns.add_to_qflist)
bind("n", "<leader>qc", "<cmd>copen<cr>")

bind("n", "<A-h>", ":vertical resize -3<CR>", { silent = true })
bind("n", "<A-l>", ":vertical resize +3<CR>", { silent = true })
bind("n", "<A-k>", ":horizontal resize -3<CR>", { silent = true })
bind("n", "<A-j>", ":horizontal resize +3<CR>", { silent = true })

bind("n", "<A-d>", "<cmd>Trouble toggle diagnostics auto_preview=false warn_no_results=false<cr>", { silent = true })
