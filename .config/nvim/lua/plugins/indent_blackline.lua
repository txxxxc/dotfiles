return {
  'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
  main = "ibl",
  opts = {
    indent = {
      char = '┊'
    },
    scope = {
      enabled = true,
      show_start = true,
    },
    whitespace = {
      remove_blankline_trail = false,
    },
  },
}
