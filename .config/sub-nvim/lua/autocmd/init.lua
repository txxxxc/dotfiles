-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

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
