local reload = function()
    for k in pairs(package.loaded) do
        -- Refresh nvn modules, keeps config
        if k:match("nvn.*") and k ~= "nvn.config" and k ~= "nvn.db" then
            package.loaded[k] = nil
        end
    end
end

local test = function()
    require('plenary.test_harness').test_directory(vim.fn.expand("%:p"))
end

vim.keymap.set('n', '<leader>pp', reload)
vim.keymap.set('n', '<leader>pt', test)
