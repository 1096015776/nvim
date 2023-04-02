local keymap = vim.keymap
keymap.set('n', '<c-g>', require('fx.utils').file_info)

keymap.set('n','<localleader><localleader>','<cmd>nohlsearch<cr>',{silent = true})
keymap.set('n','1','<cmd>lua require("telescope.builtin").find_files({no_ignore=false,hidden=true})<cr>',{silent = true})
keymap.set('n','2','<cmd>lua require("telescope.builtin").live_grep({no_ignore=false,hidden=true})<cr>',{silent = true})
keymap.set('n','3','<cmd>LazyGit<cr>',{silent = true})
keymap.set('n','4','<cmd>lua require("telescope.builtin").help_tags()<cr>',{silent = true})
keymap.set('n', '<leader>e', '<cmd>NvimTreeFindFileToggle<CR>')
vim.keymap.set('n','ss','<cmd>HopWord<cr>')
vim.keymap.set('v','ss','<cmd>HopWord<cr>')

vim.keymap.set('n','sl','<cmd>HopLine<cr>')
vim.keymap.set('v','sl','<cmd>HopLine<cr>')

vim.keymap.set('n','sf','<cmd>HopChar1<cr>')
vim.keymap.set('v','sf','<cmd>HopChar1<cr>')

vim.keymap.set('n','sc','<cmd>HopChar1CurrentLine<cr>')
vim.keymap.set('v','sc','<cmd>HopChar1CurrentLine<cr>')

