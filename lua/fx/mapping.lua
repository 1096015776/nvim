vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
local keymap = vim.keymap

-- recent open file
keymap.set('n', '<space>', '<nop>')
keymap.set('v', '<space>', '<nop>')

--visual indent
keymap.set('v','v','<esc>')
keymap.set('v','>','>gv')
keymap.set('v','<','<gv')

-- line jump
keymap.set('n','H','^')
keymap.set('n','L','g_')
keymap.set('v','H','^')
keymap.set('v','L','g_')

keymap.set('n','<c-j>','<c-w>j')
keymap.set('n','<c-k>','<c-w>k')
keymap.set('n','<c-h>','<c-w>h')
keymap.set('n','<c-l>','<c-w>l')

keymap.set('i','jk','<esc>')

keymap.set('n','<leader>w',':w<cr>')
keymap.set('n','<leader>q',':q<cr>')


keymap.set('i','<c-j>','<esc>o')
keymap.set('i','<c-k>','<esc>O')
keymap.set('n', 'X', ':keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>', { silent = true })

-- Navigate merge conflict markers
keymap.set('n', ']n', [[:call search('^\(@@ .* @@\|[<=>|]\{7}[<=>|]\@!\)', 'W')<cr>]], { silent = true })
keymap.set('n', '[n', [[:call search('^\(@@ .* @@\|[<=>|]\{7}[<=>|]\@!\)', 'bW')<cr>]], { silent = true })
-- Navigate loclist
keymap.set('n', ']l', ':lnext<cr>', { silent = true })
keymap.set('n', '[l', ':lprev<cr>', { silent = true })
keymap.set('n', ']c', ':cnext<cr>', { silent = true })
keymap.set('n', '[c', ':cprev<cr>', { silent = true })
-- Search & replace word under cursor
keymap.set('n', '<leader>sr', ':%s/\\<<c-r><c-w>\\>/')

keymap.set('n', '<c-g>', require('fx.utils').file_info)

keymap.set('n','<localleader><localleader>','<cmd>nohlsearch<cr>',{silent = true})
keymap.set('n','<leader>1','<cmd>lua require("telescope.builtin").find_files({no_ignore=false,hidden=true})<cr>',{silent = true})
keymap.set('n','<leader>2','<cmd>lua require("telescope.builtin").live_grep({no_ignore=false,hidden=true})<cr>',{silent = true})
keymap.set('n','<leader>3','<cmd>LazyGit<cr>',{silent = true})
keymap.set('n','<leader>4','<cmd>lua require("telescope.builtin").help_tags()<cr>',{silent = true})
keymap.set('n', '<leader>e', '<cmd>NvimTreeFindFileToggle<CR>')

-- use system clipboard -- copy paste
vim.keymap.set('v','y','"*y')
vim.keymap.set('v','Y','"Zy')
vim.keymap.set('v','<leader>y','"zy')
vim.keymap.set('n','<leader>p','"zp')
vim.keymap.set('i','<c-v>','<c-r>*')
