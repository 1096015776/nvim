local map = require("utils.api.map")
local cmd = require("utils.vscode").cmd
map.bulk_add({
  {
    mode={"n"},
    lhs = "<A-j>",
    rhs = ":MoveLine(1)<cr>",
    desc = "Moe Line",
  },
  -- {
  --   mode={"n"},
  --   lhs = "<c-f>",
  --   rhs = "<cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>",
  --   desc = "Moe Line",
  --   -- nnoremap ? <Cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>
  -- }
})
