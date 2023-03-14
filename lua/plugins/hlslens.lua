require('hlslens').setup{
          -- automatically clear search results
        calm_down = true,
        -- set to the nearest match to add a shot
        nearest_only = true,
}

-- hlslens mapping
vim.keymap.set('n','n',function()
  pcall(vim.cmd, "normal! " .. vim.v.count1 .. "n")
  require("hlslens").start()
end)

vim.keymap.set('n','N',function()
  pcall(vim.cmd, "normal! " .. vim.v.count1 .. "N")
  require("hlslens").start()
end)

vim.keymap.set('n','*',function()
  pcall(vim.cmd, "normal! " .. vim.v.count1 .. "*")
  require("hlslens").start()
end)

vim.keymap.set('n','#',function()
  pcall(vim.cmd, "normal! " .. vim.v.count1 .. "#")
  require("hlslens").start()
end)

vim.keymap.set('n','g*',function()
  pcall(vim.cmd, "normal! " .. vim.v.count1 .. "g*")
  require("hlslens").start()
end)

vim.keymap.set('n','g#',function()
  pcall(vim.cmd, "normal! " .. vim.v.count1 .. "g#")
  require("hlslens").start()
end)
