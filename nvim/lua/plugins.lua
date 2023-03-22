local execute = vim.api.nvim_command
local fn = vim.fn
-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')
local packer = require'packer'
local util = require'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

packer.startup(function(use)
	use {'wbthomason/packer.nvim', opt = true } -- Package manager
	use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP	

	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'

	-- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        -- newer commits break the syntax highlighting
        -- commit = 'cfa9b70'
    }
	use 'David-Kunz/markid'
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"

	use 'https://github.com/adelarsq/vim-devicons-emoji'
	use 'nvim-lualine/lualine.nvim'

	use {
		"windwp/nvim-autopairs",
    	config = function() require("nvim-autopairs").setup {} end
	}
	use({
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v<CurrentMajor>.*",
		-- install jsregexp (optional!:).
		run = "make install_jsregexp"
	})
	use { 'saadparwaiz1/cmp_luasnip' }
	use "rafamadriz/friendly-snippets"
	use 'gko/vim-coloresque'
	use {
  		"ray-x/lsp_signature.nvim",
	}
	use "nvim-lua/plenary.nvim"
	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	-- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	}
	use 'jose-elias-alvarez/nvim-lsp-ts-utils'
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
		'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
	use 'mxw/vim-jsx'
	use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
	use { "ellisonleao/gruvbox.nvim" }
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
	  require("toggleterm").setup()
	end}
	-- use "Pocco81/HighStr.nvim"
	use 'jose-elias-alvarez/null-ls.nvim'
	use 'dhruvasagar/vim-table-mode'
	use 'Pocco81/true-zen.nvim'
	use 'preservim/vim-pencil'
	use {
    	'goolord/alpha-nvim',
	}
	use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {
        'stevearc/aerial.nvim',
    }
end)
