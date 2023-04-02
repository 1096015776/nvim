-- https://github.com/theia-ide/typescript-language-server
local is_npm_package_installed = require('fx.utils').is_npm_package_installed

local have_vue = is_npm_package_installed 'vue'

if not have_vue then
  require('typescript').setup {
    server = {
      on_attach = require('fx.plugins.lsp').on_attach,
      capabilities = require('fx.plugins.lsp').capabilities,
    },
  }
end
