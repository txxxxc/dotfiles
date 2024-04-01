return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile", "VeryLazy" },
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lsp-document-symbol" },
    { "hrsh7th/cmp-nvim-lsp-signature-help", enabled = false },
  },
  init = function()
    require("utils").on_attach(function(client, bufnr) end)
    require "plugins.nvim-lspconfig.keymaps"
  end,
}
