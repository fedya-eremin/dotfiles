require("config.lib.lspconfig").defaults()

vim.lsp.enable({ "gopls", "ts_ls", "pyright", "rust_analyzer", "marksman", "prismals" })
