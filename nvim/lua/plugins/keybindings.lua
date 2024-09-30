return {
  "my/keybindings",
  dev = true,
  config = function()
    local bind = vim.keymap.set

    bind("n", "<A-t>", vim.cmd.TroubleToggle)
    bind("n", "<leader>cd", function()
      vim.cmd.cd({ "%:p:h" })
      vim.cmd.pwd()
    end)
    bind("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>")
    bind("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>")
    bind("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>")
    bind("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>")

    bind("n", "<C-c>", '"+y')
    bind("v", "<C-c>", '"+y')
    bind("t", "<ESC>", "<C-\\><C-n>")
    bind("n", "<A-e>", function()
      vim.cmd("Oil --float")
    end, { silent = true })

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


    bind("n", "<A-n>", '<cmd>set hlsearch!<cr>')

    bind("n", "<A-h>", ":vertical resize -3<CR>", { silent = true })
    bind("n", "<A-l>", ":vertical resize +3<CR>", { silent = true })
    bind("n", "<A-k>", ":horizontal resize -3<CR>", { silent = true })
    bind("n", "<A-j>", ":horizontal resize +3<CR>", { silent = true })
    bind("n", "<A-d>", "<C-d>")
    bind("n", "<A-u>", "<C-u>")
  end
}