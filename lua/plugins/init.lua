return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- {
  --   "ggandor/leap.nvim",
  --   version = "*",
  --   keys = {'s', 'S'},
  --   config = function ()
  --     require("leap").set_default_mappings()
  --   end,
  -- },

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


 -- // PLUGINS DE LSP OU CONFIGS//

  {
    "mrcjkb/rustaceanvim",
    version = "*",
    lazy = false, -- já é lazy por padrão, mas garantimos

    config = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = function()
            -- Aqui você pode colocar atalhos personalizados se quiser
          end,
          settings = {
            ["rust-analyzer"] = {
              -- checkOnSave = {
              --   command = "clippy",
              -- },
              diagnostics = {
                enable = true,
                disabled = {},
                enableExperimental = true,
              },
              inlayHints = {
                lifetimeElisionHints = {
                  enable = true,
                },
              },
            },
          },
          flags = {
            debounce_text_changes = 100,
          },
        },
      }
    end,
  };

}
