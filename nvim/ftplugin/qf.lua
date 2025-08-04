local del_qf_item = function()
	local items = vim.fn.getqflist()
	local line = vim.fn.line(".")
	table.remove(items, line)
	vim.fn.setqflist(items, "r")
	vim.api.nvim_win_set_cursor(0, { line, 0 })
end

vim.keymap.set("n", "dd", del_qf_item, { silent = true, buffer = true, desc = "Remove entry from QF" })

local del_qf_items_visual = function()
	local items = vim.fn.getqflist()
	local start_line = vim.fn.line("v")
	local end_line = vim.fn.line(".")

	-- Ensure start is before end
	if start_line > end_line then
		start_line, end_line = end_line, start_line
	end

	-- Remove items in reverse order to avoid index shifting issues
	for i = end_line, start_line, -1 do
		table.remove(items, i)
	end

	vim.fn.setqflist(items, "r")
	vim.api.nvim_win_set_cursor(0, { math.min(start_line, #items), 0 })
end

vim.keymap.set(
	"v",
	"d",
	del_qf_items_visual,
	{ silent = true, buffer = true, desc = "Remove selected entries from QF" }
)
