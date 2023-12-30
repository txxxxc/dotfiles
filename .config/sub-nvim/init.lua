vim.g.mapleader = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require('plugins')
require('editor')
require('keymaps')
require('autocmd')
require('commands')

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.

  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
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
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed

--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  clangd = {},
  tsserver = {},
  diagnosticls = {},
  lua_ls = {
    Lua = {
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
      telemetry = { enable = false },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
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

-- これみたい：https://www.reddit.com/r/neovim/comments/q5z38t/easiest_way_to_find_if_a_buffer_is_hidden/
function Execute()
  vim.cmd("vnew | put=system('exe index.cpp && timeout 2 ./a.out < stdin.txt && echo && echo ended')")
end

local function getCppWindowID()
  -- すべてのウィンドウのIDを取得
  local win_ids = vim.api.nvim_list_wins()

  for _, win_id in ipairs(win_ids) do
    -- 各ウィンドウのバッファIDを取得
    local buf_id = vim.api.nvim_win_get_buf(win_id)
    -- バッファの名前（ファイルのパス）を取得
    local buf_name = vim.api.nvim_buf_get_name(buf_id)

    -- バッファの名前が .cpp で終わっているかどうかを確認
    if buf_name:match("%.cpp$") then
      return win_id
    end
  end

  -- C++ファイルを開いているウィンドウが見つからなかった場合はnilを返す
  return nil
end

local atcoder_buffer_name = "atcoder-result"

function showOrOpenBufferByName()
  -- バッファの番号を取得
  local bufnr = vim.fn.bufnr(atcoder_buffer_name)

  -- バッファが存在しない場合、新しいバッファを作成する
  if bufnr == -1 then
    local new_buf = vim.api.nvim_create_buf(false, true)
    -- バッファに名前を割り当てる
    vim.api.nvim_buf_set_name(new_buf, atcoder_buffer_name)
    bufnr = new_buf
  end

  local result = vim.fn.systemlist('exe index.cpp && timeout 2 ./a.out < stdin.txt && echo && echo ended')

  -- すべてのウィンドウのIDを取得
  local all_window_ids = vim.api.nvim_list_wins()
  local found = false

  for _, win_id in ipairs(all_window_ids) do
    -- 各ウィンドウで表示されているバッファの番号を取得
    local win_bufnr = vim.api.nvim_win_get_buf(win_id)
    if win_bufnr == bufnr then
      -- バッファが表示されているウィンドウが見つかった場合
      vim.api.nvim_set_current_win(win_id) -- そのウィンドウをアクティブにする
      vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, result)
      found = true
      break
    end
  end

  if not found then
    -- バッファが表示されているウィンドウが見つからなかった場合、新しいウィンドウを開く
    vim.cmd("vnew")
    vim.api.nvim_win_set_buf(0, bufnr)
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, result)
  end

  local cpp_win_id = getCppWindowID()
  -- 実行した際に居たウィンドウに戻る
  vim.api.nvim_set_current_win(cpp_win_id)
end

-- -- Neovimのコマンドとして登録
-- vim.cmd("command! OpenOrCreateBuffer lua showOrOpenBufferByName()")

-- vim.keymap.set('n', '<leader>q', ':lua showOrOpenBufferByName()<CR>')
