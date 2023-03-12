vim.g.mapleader = ' '
local keymap = vim.keymap

-- recent open file
-- keymap.set('n','<leader><leader>','<c-^>')

--visual indent
keymap.set('v','v','<esc>')
keymap.set('v','>','>gv')
keymap.set('v','<','<gv')

-- line jump
keymap.set('n','H','^')
keymap.set('n','L','g_')
keymap.set('v','H','^')
keymap.set('v','L','g_')

keymap.set('i','jk','<esc>')

keymap.set('n','<leader>w',':w<cr>')
keymap.set('n','<leader>q',':q<cr>')


keymap.set('i','<c-j>','<esc>o')
keymap.set('i','<c-k>','<esc>O')