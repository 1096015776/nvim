local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = {
      'public',
      'dist',
      '.git',
      'node_modules',
      '%.min.js',
      '%.min.css',
      '%.svg',
      '%.png',
      '%.ico',
    },
    mappings = {
      i = {
        ["<Tab>"] = actions.move_selection_next,
        ["<S-Tab>"] = actions.move_selection_previous,

        ["<esc>"] = actions.close,
        ["<C-o>"] = actions.select_default,
        ["<C-k>"] = actions.preview_scrolling_up,
        ["<C-j>"] = actions.preview_scrolling_down,
     },
    },
    layout_config = {
      horizontal = {
        preview_cutoff = 100,
        preview_width = 0.6
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
    ['ui-select'] = {
      require('telescope.themes').get_cursor {},
    },
  },
}


