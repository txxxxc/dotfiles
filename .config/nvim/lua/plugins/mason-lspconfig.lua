local servers = {
  clangd = {},
  tsserver = {},
  eslint = {},
  gopls = {
    gofumpt = true,
    staticcheck = true,
  },
  diagnosticls = {
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "css" },
    init_options = {
      filetypes = {
        javascript = "eslint",
        typescript = "eslint",
        javascriptreact = "eslint",
        typescriptreact = "eslint",
      },
    },
  },
  lua_ls = {
    Lua = {
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
    },
  },
  omnisharp = {
    cmd = { "dotnet", vim.fn.stdpath "data" .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
    enable_import_completion = true,
    organize_imports_on_format = true,
    enable_roslyn_analyzers = true,
    use_mono = true,
    root_dir = function()
      return vim.loop.cwd() -- current working directory
    end,
  },
}

return {
	"williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
    },
    cond = not vim.g.vscode,
    config = function()
        local mason_lspconfig = require "mason-lspconfig"
        -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
        mason_lspconfig.setup {
          ensure_installed = { "clangd", "tsserver", "diagnosticls", "lua_ls", "omnisharp" },
        }
        mason_lspconfig.setup_handlers {
          function(server_name)
            require("lspconfig")[server_name].setup {
              capabilities = capabilities,
              settings = servers[server_name],
            }
          end,
        }
    end
}
