local bind = vim.keymap.set

bind("n", "<A-h>", vim.cmd.TroubleToggle)
bind("n", "<leader>rn", vim.lsp.buf.rename)
bind("n", "gD", vim.lsp.buf.declaration)
bind("n", "gd", vim.lsp.buf.definition)
bind("n", "<leader>h", vim.lsp.buf.hover)
bind("n", "<leader>ca", vim.lsp.buf.code_action)
