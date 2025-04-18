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
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc", "c", "python"
  		},
  	},
  },
}
