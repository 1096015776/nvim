require('mason').setup()
require("mason-lspconfig").setup()


local ensure_installed = {
  -- Language servers
  'css-lsp',
  'graphql-language-service-cli',
  'json-lsp',
  'typescript-language-server',
  'vue-language-server',
  'yaml-language-server',
  'lua-language-server',
  'terraform-ls',
  'eslint-lsp',
  'html-lsp',
  'svelte-language-server',
  'tailwindcss-language-server',
  'pyright',

  -- Linting and formatting
  'eslint_d',
  'stylua',

  -- DAP servers
  -- 'node-debug2-adapter',
  -- 'firefox-debug-adapter',
  -- 'php-debug-adapter',
}

vim.api.nvim_create_user_command('MasonInstallAll', function()
  vim.cmd('MasonInstall ' .. table.concat(ensure_installed, ' '))
end, {})