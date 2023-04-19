local map = require("utils.api.map")

map.bulk_add({
    -- reset
    {
        mode = {"n","v"},
        lhs = "<space>",
        rhs = "<nop>",
        desc = "Reset Leader",
    },
    {
        mode = {"v"},
        lhs = ">",
        rhs = ">gv",
        desc = "Change Indent",
    },

    -- indent
    {
        mode = {"n"},
        lhs = ">",
        rhs = ">>",
        desc = "Change Indent",
    },
    {
        mode = {"v"},
        lhs = "<",
        rhs = "<<",
        desc = "Change Indent",
    },

    -- jump
    {
        mode = {"n","v"},
        lhs = "H",
        rhs = "^",
        desc = "To Line Start",
    },
    {
        mode = {"n","v"},
        lhs = "L",
        rhs = "g_",
        desc = "To Line End",
    },

    -- esc
    {
        mode = {"i"},
        lhs = "jk",
        rhs = "<esc>",
        desc = "Esc",
    },

    --buffer
    {
        mode = {"n"},
        lhs = "<leader>w",
        rhs = ":w<cr>",
        desc = "Save file",
    },
    {
        mode = {"n"},
        lhs = "<leader>q",
        rhs = ":q<cr>",
        desc = "Close buffer",
    },

    -- some quick Operator
    {
        mode = {"n"},
        lhs = "X",
        rhs = ":keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>",
        desc = "Split Line",
    },
  -- move setting
    {
      mode={"v"},
      lhs = "<c-j>",
      rhs = ":MoveBlock(1)<cr>",
      desc = "Move To NextLine ",
    },
    {
      mode={"v"},
      lhs = "<c-k>",
      rhs = ":MoveBlock(-1)<cr>",
      desc = "Move To PreLine",
    },
  -- window nav
    {
        mode = {"n"},
        lhs = "<c-j>",
        rhs = "<c-w>j",
        desc = "jump down window",
    },
    {
        mode = {"n"},
        lhs = "<c-k>",
        rhs = "<c-w>k",
        desc = "jump up window",
    },
    {
        mode = {"n"},
        lhs = "<c-h>",
        rhs = "<c-w>h",
        desc = "jump left window",
    },
    {
        mode = {"n"},
        lhs = "<c-l>",
        rhs = "<c-w>l",
        desc = "jump right window",
    },
    {
        mode = {"n"},
        lhs = "<leader>s",
        rhs = ":%s/\\<<c-r><c-w>\\>/",
        desc = "Replace In Curr Word",
    },
    -- nav
    {
        mode = {"n"},
        lhs = "]n",
        rhs = [[:call search('^\(@@ .* @@\|[<=>|]\{7}[<=>|]\@!\)', 'W')<cr>]],
        desc = "Next Conflict",
    },
    {
        mode = {"n"},
        lhs = "[n",
        rhs = [[:call search('^\(@@ .* @@\|[<=>|]\{7}[<=>|]\@!\)', 'bW')<cr>]],
        desc = "Prev Conflict",
    },
    {
        mode = {"n"},
        lhs = "]l",
        rhs = ':lnext<cr>',
        desc = "Next Local List",
    },
    {
        mode = {"n"},
        lhs = "[l",
        rhs = ':lprev<cr>',
        desc = "Prev Local List",
    },
    {
        mode = {"n"},
        lhs = "]c",
        rhs = ':cnext<cr>',
        desc = "Next Quick List",
    },
    {
        mode = {"n"},
        lhs = "[c",
        rhs = ':cprev<cr>',
        desc = "Prev Local List",
    },
    {
      mode={"v"},
      lhs = "p",
      rhs = '"*p',
      desc = "use clipboard to paste",
      opts = { noremap=true }
    },
    {
      mode={"v"},
      lhs = "y",
      rhs = '"*y',
      desc = "",
      opts = { noremap=true }
    }
})

-- use system clipboard -- copy paste
vim.keymap.set('v','y','"*y')
vim.keymap.set('v','Y','"Zy')
vim.keymap.set('v','<leader>y','"zy')
vim.keymap.set('n','<leader>p','"zp')
vim.keymap.set('i','<c-v>','<c-r>*')

