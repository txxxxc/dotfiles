return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      -- Useful status updates for LSP
      "j-hui/fidget.nvim",
    },
    config = function()
      local nvim_lsp = require "lspconfig"
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
    end,
  },
  {
    -- Additional text objects via treesitter
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter" },
  },
  {
    "romgrk/barbar.nvim",
    event = "BufEnter",
    dependencies = {
      "lewis6991/gitsigns.nvim",     -- OPTIONAL: for git status
      "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = true end,

    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      maximum_padding = 0.5,
      animation = false,
      -- Disable highlighting alternate buffers
      highlight_alternate = false,
      -- Disable highlighting file icons in inactive buffers
      highlight_inactive_file_icons = false,

      -- Enable highlighting visible buffers
      highlight_visible = false,
      icons = {
        filetype = {
          -- Sets the icon's highlight group.
          -- If false, will use nvim-web-devicons colors
          custom_colors = false,

          -- Requires `nvim-web-devicons` if `true`
          enabled = true,
        },
      },
    },
    version = "^1.0.0", -- optional: only update when a new 1.x version is released
  },

  -- Git related plugins
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "folke/neodev.nvim",
  "nvim-tree/nvim-web-devicons",
  "nvim-lua/plenary.nvim",    -- All the lua functions I don't want to write twice.
  {
    "EdenEast/nightfox.nvim", -- Theme inspired by nord
    lazy = false,
  },
  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

  "lambdalisue/nerdfont.vim",
  "phaazon/hop.nvim",
  {
    "lambdalisue/fern-renderer-nerdfont.vim",
    dependencies = {
      "lambdalisue/fern.vim",
    },
  },
  "lambdalisue/glyph-palette.vim",
  "cohama/lexima.vim",
}
