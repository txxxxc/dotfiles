return {
  'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
  config = function()
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    require('indent_blankline').setup {
      char = '┊',
      show_trailing_blankline_indent = false,
      -- ex
      space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = true,
    }
  end
}
