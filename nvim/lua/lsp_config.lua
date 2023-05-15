require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls" }
})
local util = require("lspconfig/util")

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>E', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    autostart = true,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "use", "vim" },
            },
            workspace = {
                preloadFileSize = 350,
            },
            completion = {
                callSnippet = "Replace",
            },
        },
    },
}
require('lspconfig').pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- sth strange for bash
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'sh',
    callback = function()
        vim.lsp.start({
            name = 'bash-language-server',
            cmd = { 'bash-language-server', 'start' },
        })
    end,
})

require('lspconfig').eslint.setup {
    on_attach = function(client)
        -- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
        -- the resolved/server capabilities of the eslint server ourselves!
        client.server_capabilities.document_formatting = true
    end,
    settings = {
        format = { enable = true },
    },
}
-- require('lspconfig').denols.setup {
-- on_attach = on_attach,
-- 	root_dir = util.root_pattern("deno.json"),
-- 	init_options = {
-- 		lint = true,
-- 	},
-- 	filetypes = {'javascript', 'javascriptreact'}
-- }

-- require('lspconfig').quick_lint_js.setup {
-- 	filetypes = { 'javascript', 'javascriptreact' }
-- }

require("lspconfig").tsserver.setup {
    on_attach = function(client)
        require("lsp_signature").on_attach {
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            doc_lines = 2, -- will show 2 lines of comment/doc(if there are more than 2 lines in doc, will be truncated)

            floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
            hint_enable = true,
            hint_prefix = "🌟 ",
            hint_scheme = "String",
            use_lspsaga = false,
            hi_parameter = "PmenuSel", -- hl-search
            max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
            -- to view the hiding contents
            max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
            handler_opts = {
                border = "single", -- double, single, shadow, none
            },
            extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
        }
        local ts_utils = require "nvim-lsp-ts-utils"

        -- defaults
        ts_utils.setup {
            debug = false,
            disable_commands = false,
            enable_import_on_completion = false,
            import_all_timeout = 5000, -- ms

            -- eslint
            -- using eslint lsp directly now, see below
            eslint_enable_code_actions = false,
            eslint_enable_disable_comments = false,
            eslint_bin = "eslint",
            eslint_config_fallback = nil,
            eslint_enable_diagnostics = false,

            -- TODO: try out update imports on file move
            update_imports_on_move = true,
            require_confirmation_on_move = false,
            watch_dir = nil,
        }
        -- required to fix code action ranges
        ts_utils.setup_client(client)
        -- disable tsserver formatting
        client.server_capabilities.document_formatting = false
    end,
}


require('lspconfig').emmet_ls.setup({
    -- on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'html', 'htmldjango', 'typescriptreact', 'javascriptreact', },
    init_options = {
        html = {
            options = {
                -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                ["bem.enabled"] = true,
            },
        },
    }
})


require('lspconfig').clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
require('lspconfig').cssls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
require('lspconfig').vuels.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'vue' },
    root_dir = util.root_pattern('package.json', 'vue.config.js'),
    default_config = {
      root_dir = [[root_pattern("package.json", "vue.config.js")]],
    },
}
