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
  {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require 'fx.plugins.web_devicons'
    end,
  },
  {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup()
    end
  },
  {
    'folke/noice.nvim',
    config = function()
      require 'fx.plugins.noice'
    end,
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
  },

  -- core util
  'tpope/vim-repeat',
    {
      "AndrewRadev/switch.vim",
      event = { "VeryLazy" },
      config = function()
        require('fx.plugins.switch').load()
      end
  },
  {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('fx.plugins.tree')
    end
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'petertriho/cmp-git',
    },
    config = function()
      require 'fx.plugins.cmp'
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require 'fx.plugins.autopairs'
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
      require 'fx.plugins.ufo'
    end,
  },
  {
    'kylechui/nvim-surround',
    -- keys = { 'ys', 'cs', 'ds' },
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
      require 'fx.plugins.telescope'
    end,
    dependencies = {
      'nvim-lua/plenary.nvim', -- Useful Lua utilities
      -- FZF sorter for Telescope
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-ui-select.nvim',
    },
  },
  {
    'phaazon/hop.nvim',
    cmd = {
      "HopWord",
      "HopLine",
      "HopChar1",
      "HopChar1CurrentLine",
    },
    config = function()
      require('fx.plugins.hop')
    end
  },
    -- Advanced highlighting
  {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      config = function()
        require 'fx.plugins.treesitter'
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
  },
  {
    'williamboman/mason.nvim',
    config = function()
      require('fx.plugins.mason')
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim'
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('fx.plugins.lsp')
      -- require('lspconfig').tsserver.setup {}
    end
  },
  {
    'folke/which-key.nvim',
    config = function()
      require('fx.plugins.whichkey')
    end
  },
  --vsc 
    'f-person/git-blame.nvim',
    'kdheepak/lazygit.nvim',
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('fx.plugins.gitsigns')
    end
  },
  -- status
  {
    'glepnir/galaxyline.nvim',
    config = function()
      require('fx.plugins.status')
    end
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('fx.plugins.indentline')
    end
  },
  {
    'RRethy/vim-illuminate',
    config = function()
      require('fx.plugins.illuminate')
    end
  },
  {
    'kevinhwang91/nvim-hlslens',
    config = function()
      require('fx.plugins.hlslens')
    end
  },
  {
    'NvChad/nvim-colorizer.lua', -- Preview colors
    config = function()
      require('colorizer').setup {
        filetypes = { '*', '!packer' },
        user_default_options = {
          tailwind = 'lsp',
          names = false,
          sass = { enable = true, parsers = { css = true } },
        },
      }
    end,
  },
  {
    'rmagatti/auto-session',
    config = function()
    end
  },
  {
    'sindrets/diffview.nvim',
    config = function()
    end
  },
  {
    'terryma/vim-expand-region',
    config = function()
      require('fx.plugins.region')
    end
  },
  {
    'gelguy/wilder.nvim',
    event = 'CmdlineEnter',
    config = function()
      require('fx.plugins.wilder')
    end
  },
  {
    'L3MON4D3/LuaSnip',
    event = 'InsertEnter',
    config = function()
      require('fx.plugins.luasnip')
    end
  },
  {
    'stevearc/aerial.nvim',
    event = "UIEnter",
    config = function()
      require('fx.plugins.aerial')
    end
  },
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end
  },
  'fedepujol/move.nvim',
  {
    'nvim-pack/nvim-spectre',
    event = "UIEnter",
    config = function()
      require('fx.plugins.spectre')
    end
  }
})
