local M = {}

function M.map(modes, lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = opts.noremap == nil and true or opts.noremap
  if type(modes) == 'string' then
    modes = { modes }
  end
  for _, mode in ipairs(modes) do
    if type(rhs) == 'string' then
      vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
    else
      opts.callback = rhs
      vim.api.nvim_set_keymap(mode, lhs, '', opts)
    end
  end
end

function M.buf_map(buffer, modes, lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = opts.noremap == nil and true or opts.noremap
  if type(modes) == 'string' then
    modes = { modes }
  end
  for _, mode in ipairs(modes) do
    if type(rhs) == 'string' then
      vim.api.nvim_buf_set_keymap(buffer, mode, lhs, rhs, opts)
    else
      opts.callback = rhs
      vim.api.nvim_buf_set_keymap(buffer, mode, lhs, '', opts)
    end
  end
end

function M.termcode(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- Bust the cache of all required Lua files.
-- After running this, each require() would re-run the file.
local function unload_all_modules()
  -- Lua patterns for the modules to unload
  local unload_modules = {
    '^fx.',
    '^plugins.'
  }

  for k, _ in pairs(package.loaded) do
    for _, v in ipairs(unload_modules) do
      if k:match(v) then
        package.loaded[k] = nil
        break
      end
    end
  end
end

function M.reload()
  -- Stop LSP
  vim.cmd.LspStop()

  -- Stop eslint_d
  vim.fn.execute 'silent !pkill -9 eslint_d'

  -- Unload all already loaded modules
  unload_all_modules()

  -- Source init.lua
  vim.cmd.luafile '$MYVIMRC'
end

-- Restart Vim without having to close and run again
function M.restart()
  -- Reload config
  M.reload()

  -- Manually run VimEnter autocmd to emulate a new run of Vim
  vim.cmd.doautocmd 'VimEnter'
end

function M.read_json_file(filename)
  local Path = require 'plenary.path'

  local path = Path:new(filename)
  if not path:exists() then
    return nil
  end

  local json_contents = path:read()
  local json = vim.fn.json_decode(json_contents)

  return json
end

function M.read_package_json()
  return M.read_json_file 'package.json'
end

---Check if the given NPM package is installed in the current project.
---@param package string
---@return boolean
function M.is_npm_package_installed(package)
  local package_json = M.read_package_json()
  if not package_json then
    return false
  end

  if package_json.dependencies and package_json.dependencies[package] then
    return true
  end

  if package_json.devDependencies and package_json.devDependencies[package] then
    return true
  end

  return false
end

-- Useful function for debugging
-- Print the given items
function _G.P(...)
  local objects = vim.tbl_map(vim.inspect, { ... })
  print(unpack(objects))
end

function M.file_info()
    local filename = vim.fn.expand('%'):gsub(vim.pesc(vim.loop.cwd()), '.'):gsub(vim.pesc(vim.fn.expand '$HOME'), '~')
  
    local type = vim.bo.ft
    local branch = vim.b.gitsigns_head
    local lsp_client_names = table.concat(
      vim.tbl_map(function(client)
        return client.name
      end, vim.tbl_values(vim.lsp.buf_get_clients(0))),
      ', '
    )
  
    -- Each line consists of a label and a text.
    local lines = { { 'name', filename } }
    if #type > 1 then
      table.insert(lines, { 'type', type })
    end
    if branch then
      table.insert(lines, { 'branch', branch })
    end
    if #lsp_client_names > 1 then
      table.insert(lines, { 'lsp', lsp_client_names })
    end
  
    local label_lengths = vim.tbl_map(function(line)
      return #line[1]
    end, lines)
    local max_label_length = math.max(unpack(label_lengths))
  
    -- Pad labels of lines and convert each line to a string
    local lines_texts = vim.tbl_map(function(line)
      local label = line[1]
      local text = line[2]
  
      local padding = ''
      local nr_of_spaces_to_add = max_label_length - #label
      for i = 1, nr_of_spaces_to_add do
        padding = padding .. ' '
      end
  
      return label .. ': ' .. padding .. text
    end, lines)
  
    require('notify').dismiss()
  
    vim.notify(table.concat(lines_texts, '\n'), vim.log.levels.INFO, {
      title = 'File info',
    })
  end

return M
