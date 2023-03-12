require('gitsigns').setup {
    signs = {
      add = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr' },
      change = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr' },
      delete = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr' },
      topdelete = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr' },
      changedelete = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr' },
    },
    keymaps = {
      noremap = true,
  
      ['n gj'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
      ['n gk'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },
    --   ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',
      -- Text objects
      ['o ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
      ['x ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
    },
    preview_config = {
      border = 'rounded',
    },
  }