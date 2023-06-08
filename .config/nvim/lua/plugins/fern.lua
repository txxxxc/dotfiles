return {
  'lambdalisue/fern.vim',
  config = function()
    -- fern
    vim.g['fern#default_hidden'] = true
    vim.g['fern#default_exclude'] = '^\\%(\\.git\\|\\.DS_Store\\)$'
  end
}
