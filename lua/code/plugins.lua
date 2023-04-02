local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system(
    {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
     lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- core util
  'tpope/vim-repeat',
  {
    'kylechui/nvim-surround',
    -- keys = { 'ys', 'cs', 'ds' },
    config = function()
        require('nvim-surround').setup()
    end,
  },
  -- Navigation
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
  {
    'terryma/vim-expand-region',
    config = function()
      require('fx.plugins.region')
    end
  },
})
