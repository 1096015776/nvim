local spectre = require("spectre")
spectre.setup({
  open_cmd = 'new',
  mapping={
    ['send_to_qf'] = {
      map = "<c-q>",
      cmd = "<cmd>lua require('plugins.spectre').sedToQf()<CR>",
      desc = "send all item to quickfix"
    },
    ['quit'] = {
      map = "<leader>q",
      cmd = "<cmd>q<cr>",
      desc = "quit"
    },

  }
})
local M = {}
M.sedToQf = function()
  spectre.close()
  require('spectre.actions').send_to_qf()
end
return M
