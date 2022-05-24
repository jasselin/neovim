local reload = function()
    for k in pairs(package.loaded) do
        if k:match("nvn") then
            package.loaded[k] = nil
        end
    end
end

vim.keymap.set('n', '<leader>prn', reload)
