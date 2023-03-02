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

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"
	use {
    "ms-jpq/chadtree",
    	branch = "chad",
    	run = "python3 -m chadtree deps"
	}
	use 'ryanoasis/vim-devicons'
	use 'https://github.com/adelarsq/vim-devicons-emoji'
	use 'nvim-lualine/lualine.nvim'
	use { 'kyazdani42/nvim-web-devicons', opt = true }

	use {
		"windwp/nvim-autopairs",
    	config = function() require("nvim-autopairs").setup {} end
	}
	-- use "rafamadriz/friendly-snippets"
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
end)
