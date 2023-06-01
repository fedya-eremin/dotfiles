local null_ls = require("null-ls")


-- local golangci_lint = {
--     method = null_ls.methods.DIAGNOSTICS,
--     filetypes = { "go" },
--     generator = null_ls.generator({
--         command = "golangci-lint",
--         to_stdin = true,
--         from_stderr = false,
--         args = {
--             "run",
--             "--out-format",
--             "json",
--             "$DIRNAME",
--             "--path-prefix",
--             "$ROOT",
--         },
--         format = "json",
--         check_exit_code = function(code)
--             return code <= 2
--         end,
--         on_output = function(params)
--             local diags = {}
--             for _, d in ipairs(params.output.Issues) do
--                 if d.Pos.Filename == params.bufname then
--                     table.insert(diags, {
--                         row = d.Pos.Line,
--                         col = d.Pos.Column,
--                         message = d.Text,
--                     })
--                 end
--             end
--             return diags
--         end,
--     }),
-- }
-- -- add to other sources or register individually
-- null_ls.register(golangci_lint)

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.flake8.with({
			prefer_local = ".venv/bin",
		}),
		null_ls.builtins.formatting.black,
    },
})
