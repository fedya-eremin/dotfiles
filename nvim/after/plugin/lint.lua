local ft = require("guard.filetype")

-- Assuming you have guard-collection
ft("typescript,javascript,typescriptreact,javascriptreact,svelte,json"):fmt("prettier")

ft("python")
    :fmt("autopep8")
    :lint("flake8")
    :lint("mypy")

ft("c"):fmt("clang-format"):lint("clang-tidy")

ft("lua"):fmt("lsp"):append("stylua")

ft("go"):fmt("gofmt"):lint({
  cmd = "golangci-lint",
  args = { "run" },
  stdin = false,
  fname = false,
  ignore_error = true,
})

ft("rust"):fmt("rustfmt")

-- Call setup() LAST!
require("guard").setup({
  -- the only options for the setup function
  fmt_on_save = true,
  -- Use lsp if no formatter was defined for this filetype
  lsp_as_default_formatter = false,
})
