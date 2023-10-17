return {
  "rebelot/kanagawa.nvim",
  { "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate" },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },          -- Required
      { "williamboman/mason.nvim" },        -- Optional
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },  -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "L3MON4D3/LuaSnip" },  -- Required
      "hrsh7th/cmp-cmdline",
    },
  },
  "saadparwaiz1/cmp_luasnip",
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  "nvim-lualine/lualine.nvim",
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}, -- this is equalent to setup({}) function
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    -- or                              , branch = '0.1.x',
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release "
        .. "&& cmake --build build --config Release && cmake --install build --prefix build",
  },
  "jose-elias-alvarez/null-ls.nvim",
  "tpope/vim-fugitive",
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
  },
  {
    "numToStr/Comment.nvim",
    lazy = false,
  },
  "windwp/nvim-ts-autotag",
  "MaxMEllon/vim-jsx-pretty",
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  { "ellisonleao/glow.nvim",           config = true,   cmd = "Glow" },
  {
    "stevearc/aerial.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("aerial").setup()
    end,
  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
  },
  "mfussenegger/nvim-dap-python",
  {
    "m-demare/hlargs.nvim",
    config = function()
      require("hlargs").setup()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      require("ibl").setup({
        scope = {
          enabled = false,
        },
      })
    end,
  },
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
  },
  "rcarriga/nvim-notify",
  {
    "michaelb/sniprun",
    branch = "master",

    build = "sh install.sh",

    config = function()
      require("sniprun").setup({
        display = {
          "NvimNotify",
        },
        display_options = {
          notification_timeout = 10, -- in seconds
        },
      })
    end,
  },
  {
    "nvimdev/guard.nvim",
    -- Builtin configuration, optional
    dependencies = {
        "nvimdev/guard-collection",
    },
  }
}
