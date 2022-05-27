local reload = function()
    for k in pairs(package.loaded) do
        -- Refresh nvn modules, keeps config
        if k:match("nvn.*") and k ~= "nvn.config" then
            package.loaded[k] = nil
        end
    end
end

vim.keymap.set('n', '<leader>pp', reload)
