local telescope = require("telescope")
local actions = require("telescope.actions")
telescope.setup({
  defaults = {
    initial_mode = "normal",
  },
  pickers = {
    find_files = {
      hidden = true,
      cwd = "~",
      previewer = false,
    },
    buffers = {
      mappings = {
        n = {
          ["d"] = actions.delete_buffer + actions.move_to_top,
        },
        i = {
          ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
        },
      },
      previewer = false,
    },
  },
  extensions = {
    aerial = {},
  },
})

local builtin = require("telescope.builtin")
telescope.load_extension("fzf")
telescope.load_extension("aerial")
vim.keymap.set("n", "<leader>v", builtin.find_files, {})
vim.keymap.set("n", "<A-v>", function()
  builtin.find_files({ cwd = "." })
end, {})
vim.keymap.set("n", "<leader>g", builtin.git_files, {})
vim.keymap.set("n", "<leader>b", builtin.buffers, {})
vim.keymap.set("n", "<leader>ht", builtin.help_tags, {})
vim.keymap.set("n", "<leader>j", builtin.keymaps, {})
vim.keymap.set("n", "<leader>rg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>a", telescope.extensions.aerial.aerial, {})
