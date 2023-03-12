local  which_key = require "which-key"

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local mappings = {
  ["w"] = { "<cmd>w<CR>", "Save" },
  ["q"] = { "<cmd>q<CR>", "Quit" },
  ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
  ["<leader>"] = {"<c-^>",'last'},
  -- project
  t = {
    name = "telescope",
    f = {  
      '<cmd>lua require("telescope.builtin").find_files({no_ignore=false,hidden=true})<cr>',
      "files",
    },
    d = {
      '<cmd>lua require("telescope.builtin").diagnostics()<cr>',
      "diagnostics",
    },
    g = {
      '<cmd>lua require("telescope.builtin").live_grep({no_ignore=false,hidden=true})<cr>', "Text" 
    },
    u = {
      '<cmd>lua require("telescope.builtin").colorscheme()<cr>',
      'ui'
    },
    h = {
      '<cmd>lua require("telescope.builtin").help_tags()<cr>',
      'help'
    }
  },
  g = {
    name = "git",
    s = {
      '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      'stage'
    },
    r = {
      '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      'reset'
    },
    p = {
      '<cmd>lua require"gitsigns".preview_hunk()<CR>',
      'preview'
    },
    l = {
      '<cmd>LazyGit<cr>',
      'lazygit'
    }
  },
  l = {
    name = "lsp",
    f = {
      "vim.lsp.buf.format({ async = true })",
      'format'
    }
  }
}

which_key.register(mappings, opts)


