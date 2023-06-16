local builtin = require('telescope.builtin')
vim.keymap.set('n', 'tff', builtin.find_files, {})
vim.keymap.set('n', 'tfg', builtin.live_grep, {})
vim.keymap.set('n', '<A-b>', builtin.buffers, {})
vim.keymap.set('n', 'tfh', builtin.lsp_references, {})
vim.keymap.set('n', 'tfx', builtin.quickfix, {})
require("telescope").load_extension "file_browser"
