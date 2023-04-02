require('nvim-treesitter.configs').setup {
    highlight = {
      enable = true,
      use_languagetree = true,
    },
    indent = {
      enable = true,
    },
    playground = {
      enable = false,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
    },
    autotag = {
      enable = true,
    },
    autopairs = {
      enable = true,
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    matchup = {
      enable = true,
    },
    ensure_installed = {
      'javascript',
      'jsdoc',
      'typescript',
      'tsx',
      'json',
      'python',
      'html',
      'graphql',
      'lua',
      'vue',
      'yaml',
      'css',
      'bash',
      'scss',
      'vim',
      'markdown',
      'markdown_inline',
      'sql',
      'regex',
    },
  }