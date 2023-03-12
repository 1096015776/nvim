local nvim_lsp = require('lspconfig')

local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', 'g]', vim.diagnostic.goto_next, opts)


local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gh', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'r', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
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
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
}

