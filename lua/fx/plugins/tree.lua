vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
local api = require("nvim-tree.api")
local searchInDir = function()
  local currNode = api.tree.get_node_under_cursor()
  local cwd = ''
  if (currNode.type == 'directory') then
    cwd = currNode.absolute_path .. '/*'
  else
    cwd = string.sub(currNode.absolute_path,0,string.len(currNode.absolute_path)-string.len(currNode.name))
  end
  require('spectre').open({
      is_insert_mode = true,
      cwd = cwd,
      search_text="",
      replace_text="",
      path="",
      is_close = true, -- close an exists instance of spectre and open new
    })
end
local M = {}
function M.on_attach(bufnr)
  local options = {  buffer = bufnr, noremap = true, silent = true, nowait = true }
    vim.keymap.set('n', 'gY', api.fs.copy.absolute_path,options)
    vim.keymap.set('n', 'gy', api.fs.copy.relative_path,options)
    vim.keymap.set('n', 'r', api.fs.rename,options)
    vim.keymap.set('n', 'x', api.fs.remove,options)
    vim.keymap.set('n', 'a', api.fs.create,options)
    vim.keymap.set('n', 'o', api.node.open.edit,options)
    vim.keymap.set('n', 'O', api.node.open.tab,options)
    vim.keymap.set('n', '<cr>', api.node.open.vertical,options)
    -- vim.keymap.set('n', '<cr>', api.node.open.vertical,options)
    vim.keymap.set('n', 'l', api.node.open.edit,options)
    vim.keymap.set('n', 'h', api.node.navigate.parent_close,options)
    vim.keymap.set('n', '<esc>', api.tree.close,options)
    vim.keymap.set('n', 'q', api.tree.close,options)
    vim.keymap.set('n', 'y', api.fs.copy.node,options)
    vim.keymap.set('n', 'd', api.fs.cut,options)
    vim.keymap.set('n', 'p', api.fs.paste,options)
    vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,options)
    vim.keymap.set('n','<c-f>',searchInDir,options)
end

require("nvim-tree").setup({
  actions = {
    open_file={quit_on_open = true}
  },
  on_attach = M.on_attach,
  view = {
    width = 30,
    float = {
        enable = true,
        quit_on_focus_loss = true,
        open_win_config = function()
          local columns = vim.o.columns
          local lines = vim.o.lines
          local width = math.max(math.floor(columns * 0.5), 50)
          local height = math.max(math.floor(lines * 0.5), 20)
          local left = math.ceil((columns - width) * 0.5)
          local top = math.ceil((lines - height) * 0.5 - 2)
          return { relative = "editor", border = "rounded", width = width, height = height, row = top, col = left }
        end,
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    debounce_delay = 50,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    custom = { "^.git$","^node_modules$" }
  },
  git = {
    enable = true
  },
  log = {
    enable = true,
    types={
      diagnostics = true
    }
  },
  ui = {
    confirm = {
        remove = false
    }
  }
})
