return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "ggandor/leap.nvim",
    version = "*",
    keys = {'s', 'S'},
    config = function ()
      require("leap").set_default_mappings()
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
  },

  {
    "rcarriga/nvim-notify",
    version = "*",
    config = function ()
      vim.notify = require("notify")
    end,
    lazy = false,
  },

  {
    'mrcjkb/rustaceanvim',
    version = "*", -- Recommended
    lazy = false, -- This plugin is already lazy
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc", "c", "python", "rust"
  		},
  	},
  },
}
