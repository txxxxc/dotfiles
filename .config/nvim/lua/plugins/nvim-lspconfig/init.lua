return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile", "VeryLazy" },
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lsp-document-symbol" },
    { "hrsh7th/cmp-nvim-lsp-signature-help", enabled = false },
  },
  cond = not vim.g.vscode,
  init = function()
    require("utils").on_attach(
      function(client, bufnr)
        local on_attach = require("plugins.nvim-lspconfig.on_attach")
        on_attach(client, bufnr)
      end
    )
  end,
}