local ft = require('guard.filetype')

-- Assuming you have guard-collection
ft('typescript,javascript,typescriptreact,javascriptreact,svelte')
  :fmt('prettier')

ft('python')
  :fmt('autopep8')
  :lint('flake8')

ft('c')
  :fmt('clang-format')
  :lint('clang-tidy')

ft('lua')
  :fmt('lsp')
  :append('stylua')
  :lint('selene')

-- Call setup() LAST!
require('guard').setup({
    -- the only options for the setup function
    fmt_on_save = true,
    -- Use lsp if no formatter was defined for this filetype
    lsp_as_default_formatter = false,
})
