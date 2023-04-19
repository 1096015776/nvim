local map = require("utils.api.map")
local cmd = require("utils.vscode").cmd
map.bulk_add({
  {
    mode={"n"},
    lhs = "<leader>c",
    rhs = cmd("turboConsoleLog.displayLogMessage"),
    desc = "vscode console",
  },
  {
    mode={"n"},
    lhs = "gj",
    rhs = cmd("workbench.action.editor.nextChange"),
    desc = "vscode next diff change",
  },
  {
    mode={"n"},
    lhs = "gk",
    rhs = cmd("workbench.action.editor.previousChange"),
    desc = "vscode prev diff change",
  },
  {
    mode={"n"},
    lhs = "g]",
    rhs = cmd("editor.action.marker.nextInFiles"),
    desc = "vscode next diagnostic",
  },
  {
    mode={"n"},
    lhs = "g[",
    rhs = cmd('workbench.action.editor.previousChange'),
    desc = "vscode prev diagnostic",
  },
  {
    mode={"n"},
    lhs = "<leader>o",
    rhs = cmd('workbench.action.toggleAuxiliaryBar'),
    desc = "vscode outline",
  }

  -- {
  --   mode={"n"},
  --   lhs = "<c-f>",
  --   rhs = "<cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>",
  --   desc = "Moe Line",
  --   -- nnoremap ? <Cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>
  -- }
})
