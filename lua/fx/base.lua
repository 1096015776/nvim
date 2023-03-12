vim.cmd('colorscheme darcula-solid')
vim.fn.sign_define('DiagnosticSignError', { numhl='DiagnosticSignError',text = '' })
vim.fn.sign_define('DiagnosticSignWarn', { numhl = 'DiagnosticSignWarn', text = '' })
-- Highlight text after yanking
vim.api.nvim_create_autocmd('TextYankPost', {
    group = group,
    callback = function()
      require('vim.highlight').on_yank { higroup = 'Substitute', timeout = 200 }
    end,
})
-- vim.cmd('colorscheme everforest')