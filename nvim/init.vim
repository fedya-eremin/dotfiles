set number
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set mouse=nvi
set softtabstop=2
set nobackup
set nowritebackup
set encoding=utf-8
set clipboard=unnamedplus
set textwidth=80
set noswapfile

inoremap <silent> <F2> <ESC>:execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<CR>a 
nnoremap <silent> <F2> :execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<CR> 
vnoremap <F2> <ESC>
" g:isort_command = 'isort'
nnoremap <C-b> :Black<CR>
nnoremap <C-i> :Isort<CR>

nnoremap <A-l> :vertical resize +5<CR>
nnoremap <A-h> :vertical resize -5<CR>
tnoremap <Esc> <C-\><C-n>
" Start NERDTree. If a file is specified, move the cursor to its window.
" autocmd StdinReadPre * let s:std_in=1 autocmd VimEnter * NERDTree | if
" argc() > 0 || exists("s:std_in") | wincmd p | endif
autocmd VimEnter * NvimTreeOpen
" THIS IS FROM COC REPO I HAVE NO CLUE HOW IT WORKS
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
	  \ CheckBackspace() ? "\<Tab>" :
	  \ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>

nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>
nnoremap <silent>		 <A-f> <Cmd>NvimTreeToggle<CR>

let g:python3_host_prog = '/usr/bin/python'


let g:black#settings = {'fast': 1, 'line_length': 80}


call plug#begin()
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " this is for auto complete, prettier and tslinting

let g:coc_global_extensions = ['coc-tsserver', 'coc-html', 'coc-lua', 'coc-json', 'coc-python', 'coc-deno']  " list of CoC extensions needed
Plug 'neovim/nvim-lspconfig' " lsp or idk what is it
Plug 'vim-scripts/c.vim'
Plug 'terryma/vim-multiple-cursors' " pretty funny feature

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {

" these two plugins will add highlighting and indenting to JSX and TSX files.
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'sumneko/lua-language-server' " lua lsp
Plug 'denoland/deno' " js lsp
Plug 'danielpza/eslint-lsp'
Plug 'microsoft/pyright' " python lsp
Plug 'nvie/vim-flake8'
Plug 'averms/black-nvim', {'do': ':UpdateRemotePlugins'}
Plug 'stsewd/isort.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'SimonZehetner/python_venv.nvim'
Plug 'flebel/vim-mypy', { 'for': 'python', 'branch': 'bugfix/fast_parser_is_default_and_only_parser' }

Plug 'mhartington/formatter.nvim'

Plug 'ellisonleao/glow.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }


Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets' " jsx snippets provider for coc (do not forget to :CocInstall coc-snippets)

" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' } " GOAT, but conflicts with coc
" Plug 'davidhalter/jedi-vim'
Plug 'vim-airline/vim-airline'
Plug 'rust-lang/rust.vim'
Plug 'majutsushi/tagbar'  " show tags in a bar (functions etc) for easy browsing
Plug 'ryanoasis/vim-devicons'


Plug 'romgrk/barbar.nvim'
Plug 'nvim-tree/nvim-web-devicons'
" Plug 'preservim/nerdtree'
Plug 'nvim-tree/nvim-tree.lua'


Plug 'preservim/vim-pencil' " improved text wrapping and much more...
call plug#end()


lua << EOF
	require('lspconfig').lua_ls.setup {}
	require('lspconfig').clangd.setup {}

	local status, nvim_lsp = pcall(require, 'lspconfig')
	local util = require 'lspconfig/util'
	require("nvim-web-devicons").setup{ default = true }
	require("nvim-web-devicons").setup{ default = true }

	local opts = { noremap=true, silent=true }
	vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)

	local opts = { noremap=true, silent=true }
	vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
	vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
	vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
	vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
	local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
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
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
		vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
		vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
	end



	nvim_lsp.denols.setup {
	on_attach = on_attach,
		root_dir = nvim_lsp.util.root_pattern("deno.json"),
		init_options = {
			lint = true,
		},
		filetypes = {'javascript', 'javascriptreact'}
	}

	nvim_lsp.tsserver.setup {
		on_attach = on_attach,
		root_dir = nvim_lsp.util.root_pattern("package.json"),
		init_options = {
			lint = true,
		},
		filetypes = { 'typescript', 'typescriptreact' }
	}

	require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    root_dir = function(fname)
        local root_files = {
            'pyproject.toml',
            'setup.py',
            'setup.cfg',
            'requirements.txt',
            'Pipfile',
            'pyrightconfig.json',
        }
        return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
    end,
	settings = {
		analysis = {
				reportMissingTypeStubs = false,
			},
		},
	}

	require'nvim-treesitter.configs'.setup {
		-- A list of parser names, or "all" (the four listed parsers should always be installed)
		--highlights = {
		--	enable = true,
		--},
		ensure_installed = { "c", "lua", "vim", "help", "javascript", "typescript", "python", "rust" },
	}

	-- examples for your init.lua

	-- disable netrw at the very start of your init.lua (strongly advised)
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1

	-- set termguicolors to enable highlight groups
	-- vim.opt.termguicolors = true

	-- empty setup using defaults
	require("nvim-tree").setup()

	-- OR setup with some options
	require("nvim-tree").setup({
		auto_reload_on_write = true,
		sync_root_with_cwd          = true,
		sort_by = "case_sensitive",
		view = {
			width = 30,
			mappings = {
				list = {
					{ key = "u", action = "dir_up" },
				},
			},
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = true,
		},
	})

EOF
