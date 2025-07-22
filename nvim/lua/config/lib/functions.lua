local M = {}

M.close_floating_windows = function()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local config = vim.api.nvim_win_get_config(win)
		if config.relative ~= "" then -- is_floating_window?
			vim.api.nvim_win_close(win, false) -- do not force
		end
	end
end

M.toggle_diagnostics = function()
	if vim.g.diagnostics_visible then
		vim.g.diagnostics_visible = false
		vim.diagnostic.enable(false)
		print("Diagnostics disabled")
	else
		vim.g.diagnostics_visible = true
		vim.diagnostic.enable()
		print("Diagnostics enabled")
	end
end
M.add_to_qflist = function()
	local file = vim.fn.expand("%")
	local lnum = vim.fn.line(".")
	local text = vim.fn.getline(".")
	vim.fn.setqflist({ {
		filename = file,
		lnum = lnum,
		col = 1,
		text = text,
	} }, "a")
	print("Added to quickfix: " .. file .. ":" .. lnum)
end

return M
