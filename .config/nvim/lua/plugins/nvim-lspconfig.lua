-- Additional lua configuration, makes nvim stuff amazing
return {
  'folke/neodev.nvim',
  config = function()
    -- Setup neovim lua configuration
    require('neodev').setup()
  end
}
