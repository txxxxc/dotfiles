local format_on_save_group = vim.api.nvim_create_augroup("FormatOnSaveGroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    if vim.bo.filetype == "typescriptreact" then
      print "typescriptreact"
      -- prettier実行してからESLintを実行する
      -- vim.lsp.buf.format()
      vim.cmd "EslintFixAll"
      return
    end
    if vim.bo.filetype == "cpp" then return end
    vim.lsp.buf.format()
  end,
  group = format_on_save_group,
  pattern = "*",
})

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function() vim.highlight.on_yank() end,
  group = highlight_group,
  pattern = "*",
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function() vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" } end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
    -- machine and codebase, you may want longer. Add an additional
    -- argument after params if you find that you have to write the file
    -- twice for changes to be saved.
    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({ async = false })
  end
})

local template_group = vim.api.nvim_create_augroup("template", { clear = true })
vim.api.nvim_create_autocmd("BufNewFile", {
  group = template_group,
  command = "0r ~/.config/sub-nvim/templates/atcoder.cpp",
  pattern = "*/competitive-programming/**/*.cpp",
})

-- personal settings
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  callback = function()
    for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
      if vim.api.nvim_win_get_config(winid).zindex then return end
    end
    vim.diagnostic.open_float({
      format = function(diagnostic)
        return string.format("%s (%s: %s)", diagnostic.message, diagnostic.source, diagnostic.code)
      end,
    }, { focus = false })
  end,
})
