vim.g.indent_blankline_filetype_exclude = {
  'help'
}
require("indent_blankline").setup {
  show_current_context_start = false,
  show_current_context = true,
  show_end_of_line = true,
}
