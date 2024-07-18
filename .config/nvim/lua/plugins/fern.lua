return {
  'lambdalisue/fern.vim',
  cond = not vim.g.vscode,
  dependencies = {
    'lambdalisue/nerdfont.vim',
    'lambdalisue/glyph-palette.vim',
  },
  keys = {
    { "<leader>e", "<cmd>Fern . -reveal=% -drawer -toggle -width=40<cr>", desc = "toggle Fern", silent = true },
  },
  config = function()
    -- fern
    vim.g['fern#default_hidden'] = true
    vim.g['fern#renderer'] = "nerdfont"
    vim.g['fern#default_exclude'] = '^\\%(\\.git\\|\\.DS_Store\\)$'
  end
}
