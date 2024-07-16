return {
  -- Set lualine as statusline
  -- See `:help lualine.txt`
  'nvim-lualine/lualine.nvim', -- Fancier statusline
  cond = not vim.g.vscode,
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = false,
        theme = 'nordfox',
        component_separators = '|',
        section_separators = '',
      },
    }
  end
}
