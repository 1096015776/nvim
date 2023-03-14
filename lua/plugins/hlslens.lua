require('hlslens').setup{
          -- automatically clear search results
        calm_down = true,
        -- set to the nearest match to add a shot
        nearest_only = true,
}
vim.keymap.set('n','n',function()
  pcall(vim.cmd, "normal! " .. vim.v.count1 .. "n")
  require("hlslens").start()
end)


