return {
  'lambdalisue/fern.vim',
  dependencies = {
    'lambdalisue/nerdfont.vim',
    'lambdalisue/glyph-palette.vim',
  },
  config = function()
    -- fern
    vim.g['fern#default_hidden'] = true
    vim.g['fern#renderer'] = "nerdfont"
    vim.g['fern#default_exclude'] = '^\\%(\\.git\\|\\.DS_Store\\)$'
  end
}
