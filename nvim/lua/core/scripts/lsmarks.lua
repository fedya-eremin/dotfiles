function _G.lsmarks()
  local buf = vim.api.nvim_create_buf(false, true)
  local marks_output = vim.fn.execute("marks")
  local lines = {}
  for line in marks_output:gmatch("[^\r\n]+") do
    table.insert(lines, line)
  end
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  local current_win = vim.api.nvim_get_current_win()
  local current_width = vim.api.nvim_win_get_width(current_win)
  local current_height = vim.api.nvim_win_get_height(current_win)
  local opts = {
    relative = "editor",
    width = 75,
    height = 20,
    row = math.floor((current_height - 20) / 2),
    col = math.floor((current_width - 75) / 2),
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  }
  local win = vim.api.nvim_open_win(buf, true, opts)
  vim.api.nvim_win_set_option(win, "number", false)
  vim.api.nvim_win_set_option(win, "relativenumber", false)
  vim.api.nvim_buf_set_keymap(buf, "n", "q", ":q<CR>", {})
end
