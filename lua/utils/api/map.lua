local M = {}

function M.add(map)
    map.opts = map.opts or {silent = true}
    map.opts.desc = map.desc
    if type(map.rhs) == "function" or map.opts.buffer then
        vim.keymap.set(
            map.mode,
            map.lhs,
            map.rhs,
            map.opts
        )
        return
    end

    for _,mode in pairs(map.mode) do 
        vim.api.nvim_set_keymap(
            mode,
            map.lhs,
            map.rhs,
            map.opts
        )
    end
    
end

function M.bulk_add(maps)
    for _, map in ipairs(maps) do
        M.add(map)
    end
end

return M