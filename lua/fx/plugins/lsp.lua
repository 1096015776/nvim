local nvim_lsp = require('lspconfig')

local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', 'g]', vim.diagnostic.goto_next, opts)


local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gh', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<localleader>r', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<localleader>a', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<localleader>d', function()
    vim.diagnostic.open_float({ border = true and "rounded" or "none" })
  end,bufopts)
  vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', bufopts)
  -- vim.keymap.set('n','<localleader>m','vim.lsp.diagnostic.get_all()',bufopts)
  vim.keymap.set('n', '<leader>d', '<cmd>Telescope lsp_document_symbols<cr>', bufopts)
  if client.server_capabilities.definitionProvider then
    vim.keymap.set('n', '<LeftMouse>', '<LeftMouse><cmd>lua vim.lsp.buf.definition()<CR>', { silent = true })
  end
end


nvim_lsp.pyright.setup { 
  on_attach = on_attach,
}
nvim_lsp.lua_ls.setup { 
  on_attach = on_attach,
}
nvim_lsp.vuels.setup {
  on_attach = on_attach,
}
local M ={}
M.filter_publish_diagnostics = function(a, params, client_info, extra_message, config)
  local client = vim.lsp.get_client_by_id(client_info.client_id)

  local ignore_diagnostic_message = extra_message.ignore_diagnostic_message or {}
  local ignore_diagnostic_level = vim.tbl_map(function(level)
      return vim.diagnostic.severity[level:upper()]
  end, extra_message.ignore_diagnostic_level or {})
  if ignore_diagnostic_message then
      local new_index = 1

      for _, diagnostic in ipairs(params.diagnostics) do
          if
              not (
                  vim.tbl_contains(ignore_diagnostic_level, diagnostic.severity) -- disable level
                  or vim.tbl_contains(ignore_diagnostic_message, diagnostic.message) -- disable message
              )
          then
              params.diagnostics[new_index] = diagnostic
              new_index = new_index + 1
          end
      end

      for i = new_index, #params.diagnostics do
          params.diagnostics[i] = nil
      end
  end
  vim.lsp.diagnostic.on_publish_diagnostics(a, params, client_info, extra_message, config)
end 
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(M.filter_publish_diagnostics, {
      ignore_diagnostic_level = {},
      ignore_diagnostic_message = ignore_diagnostic_message,
    }),
  }
}

