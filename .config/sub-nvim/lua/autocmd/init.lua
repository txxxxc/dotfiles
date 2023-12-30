vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback =
      function()
        vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
      end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('MyAutocmdsJavaScriptFormatting', {}),
  pattern = { '*.tsx', '*.ts', '*.jsx', '*.js', '*.vue' },
  command = 'silent! EslintFixAll',
})

local template_group = vim.api.nvim_create_augroup('template', { clear = true })
vim.api.nvim_create_autocmd('BufNewFile', {
  group = template_group,
  command = '0r ~/.config/sub-nvim/templates/atcoder.cpp',
  pattern = '*/competitive-programming/**/*.cpp',
})

-- personal settings
vim.api.nvim_create_autocmd(
  { "CursorHold", "CursorHoldI" },
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
