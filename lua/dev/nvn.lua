local reload = function()
    for k in pairs(package.loaded) do
        if k:match("nvn.") then
            print(vim.inspect(k))
            package.loaded[k] = nil
        end
    end
    print('nvn.reload')
end

vim.keymap.set('n', '<leader>prn', reload)
