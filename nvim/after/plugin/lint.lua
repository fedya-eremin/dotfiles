local ft = require("guard.filetype")
local lint = require('guard.lint')

-- Assuming you have guard-collection
ft("typescript,javascript,typescriptreact,javascriptreact,svelte,json"):fmt("prettier")

ft("python"):fmt("autopep8"):lint("flake8")
-- :lint("mypy")

ft("c"):fmt("clang-format"):lint("clang-tidy")

ft("lua"):fmt("lsp"):append("stylua")
ft("ocaml"):fmt({
  cmd = "ocamlformat",
  args = {
    "--break-cases=toplevel",
    "--if-then-else=fit-or-vertical",
    "--enable-outside-detected-project",
    "-",
    "--name",
  },
  stdin = true,
  fname = true,
  ignore_error = true,
})
ft("go"):fmt("gofmt"):lint({
  cmd = "golangci-lint",
  args = { "run" },
  stdin = false,
  fname = false,
  ignore_error = true,
})

ft("sql"):lint({
  cmd = 'sqlfluff',
  args = { 'lint', '-', '-f', 'github-annotation', '--dialect', 'postgres' },
  stdin = true,
  parse = lint.from_json({
    attributes = {
      row = 'line',
      col = 'start_column',
      end_col = 'end_column',
      severity = 'annotation_level',
      message = 'message',
    },
    severities = {
      notice = lint.severities.info,
      warning = lint.severities.warning,
      error = lint.severities.error,
    },
    source = 'sqlfluff',
  }),
})

ft("rust"):fmt("rustfmt")

-- Call setup() LAST!
require("guard").setup({
  -- the only options for the setup function
  fmt_on_save = true,
  -- Use lsp if no formatter was defined for this filetype
  lsp_as_default_formatter = false,
})
