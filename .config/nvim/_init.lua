require('plugins')
require('editor')
require('keymaps')

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Enable Comment.nvim
require('Comment').setup()

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --

  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<leader>ssd', vim.lsp.buf.signature_help, '[S]ignature [D]ocumentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  clangd = {},
  tsserver = {},

  sumneko_lua = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = cmp.config.sources({
    { name = 'luasnip', option = { show_autosnippets = false } },
    {
      name = "nvim_lsp",
      entry_filter = function(entry)
          return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind()
      end
    },
  }),
}

-- personal settings

vim.api.nvim_create_autocmd(
  {"CursorHold", "CursorHoldI"},
  {
    pattern = "*",
    callback = function()
      for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
        if vim.api.nvim_win_get_config(winid).zindex then
          return
        end
      end
      vim.diagnostic.open_float(
        {
          format = function(diagnostic)
            return string.format(
              "%s (%s: %s)",
              diagnostic.message,
              diagnostic.source,
              diagnostic.code
            )
          end
        },
        { focus = false, }
      )
    end
  }
)

vim.api.nvim_create_autocmd("BufEnter",{ callback =
  function()
    vim.opt.formatoptions = vim.opt.formatoptions - { "c","r","o" }
  end,
})


vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('MyAutocmdsJavaScriptFormatting', {}),
  pattern = { '*.tsx', '*.ts', '*.jsx', '*.js', '*.vue' },
  command = 'silent! EslintFixAll',
})

-- nvim-tmux-navigation
require'nvim-tmux-navigation'.setup {
  disable_when_zoomed = true, -- defaults to false
  keybindings = {
    left = "<c-h>",
    down = "<c-j>",
    up = "<c-k>",
    right = "<c-l>",
  }
}

-- competitive programming
local template_group = vim.api.nvim_create_augroup('template', { clear = true })
vim.api.nvim_create_autocmd('BufNewFile', {
  group = template_group,
  command = '0r ~/.config/nvim/templates/atcoder.cpp',
  pattern = '*/competitive-programming/**/*.cpp',
})

-- vim.keymap.set('n', '<leader>q', ':QuickRun<CR>')
vim.g['quickrun_config'] = {
  cpp = {
    command = 'g++',
    input = 'stdin.txt',
    -- コイツらだめでした→-fsanitize=address -fsanitize=undefined 
    cmdopt = '-Wall -Wextra -pedantic -std=c++14 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wshift-overflow -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -fno-sanitize-recover -fstack-protector',
  },
  _ = {
    ['outputter/error/success'] = 'buffer',
    ['outputter/error/error'] = 'quickfix',
    ['outputter/quickfix/open_cmd'] = 'copen',
    ['hook/time/enable'] = 1,
  }
}
-- これみたい：https://www.reddit.com/r/neovim/comments/q5z38t/easiest_way_to_find_if_a_buffer_is_hidden/
function Execute()
  vim.cmd("vnew | put=system('exe index.cpp && timeout 2 ./a.out < stdin.txt && echo && echo ended')")
end

vim.keymap.set('n', '<leader>q', ':lua Execute()<CR>')

