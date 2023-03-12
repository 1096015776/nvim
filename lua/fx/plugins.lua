local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system(
    {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
     lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Colorscheme
  {
    'briones-gabriel/darcula-solid.nvim',
    dependencies = {'rktjmp/lush.nvim'}
  },
  'sainnhe/everforest',
  'navarasu/onedark.nvim',
  'shaunsingh/nord.nvim',

  -- core util
  'tpope/vim-repeat',
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require 'plugins.autopairs'
    end,
  },
  {
    'numToStr/Comment.nvim',
    keys = {
        { 'gc', mode = { 'n', 'v' }, 'gcc' },
    },
    config = function()
      require('Comment').setup {
          pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end,
  },
  {
    'antoinemadec/FixCursorHold.nvim',
    config = function()
        vim.g.cursorhold_updatetime = 500
    end,
  },
  {
    'andymass/vim-matchup',
    config = function()
      vim.g.matchup_matchparen_offscreen = {}
    end,
  },
  { -- Improve folding
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    config = function()
    --   require 'j.plugins.ufo'
    end,
  },
  {
    'kylechui/nvim-surround',
    keys = { 'ys', 'cs', 'ds' },
    config = function()
        require('nvim-surround').setup()
    end,
  },
  {
    'declancm/cinnamon.nvim',
    event = 'BufEnter',
    config = function()
      require('cinnamon').setup {
        extra_keymaps = true,
        default_delay = 2,
        max_length = 60,
        hide_cursor = true,
        scroll_limit = -1,
      }
    end,
  },
  -- Navigation
  {
    -- Fuzzy finder
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    config = function()
    --   require 'j.plugins.telescope'
    end,
    dependencies = {
      'nvim-lua/plenary.nvim', -- Useful Lua utilities

      -- FZF sorter for Telescope
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-ui-select.nvim',
    },
  },
  {
    'tamago324/lir.nvim', -- File explorer
    config = function()
    --   require 'j.plugins.lir'
    end,
  },
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').set_default_keymaps()
    end,
  },
    -- Advanced highlighting
  {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      config = function()
        require 'plugins.treesitter'
      end,
      dependencies = {
        'windwp/nvim-ts-autotag', -- Automatically end & rename tags
        -- Dynamically set commentstring based on cursor location in file
        { 'JoosepAlviste/nvim-ts-context-commentstring', dev = false },
        'nvim-treesitter/playground',
      },
    },
    --lang feature
    {
      'axelvc/template-string.nvim',
      config = function()
        require('template-string').setup {
          filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'vue' },
          remove_template_string = true,
          restore_quotes = {
            normal = [[']],
            jsx = [["]],
          },
        }
      end,
      event = 'InsertEnter',
      ft = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'vue' },
    }
})