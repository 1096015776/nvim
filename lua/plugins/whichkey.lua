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
  u = {
    name = "util",
    ['t'] = { '<cmd>ToggleAlternate<CR>', 'switch' },
  },
  t = {
    name = "telescope",
    f = {  
      '<cmd>lua require("telescope.builtin").find_files({no_ignore=false,hidden=true})<cr>',
      "Find files",
    },
    g = {
      '<cmd>lua require("telescope.builtin").live_grep({no_ignore=false,hidden=true})<cr>', "Find Text" 
    }
  },
}

which_key.register(mappings, opts)


