-- options.lua

-- ui
vim.o.termguicolors = true                -- 24-bit colors
vim.o.title = true                        -- file path in title bar
vim.o.updatetime = 250                    -- faster refresh

-- editor
vim.o.expandtab = true                    -- use spaces instead of tabs
vim.o.shiftwidth = 4                      -- 4 spaces used for each indent
vim.o.tabstop = 4                         -- tab displayed as 4 characters
vim.o.shiftround = true                   -- round indents to multiple of shiftwidth
vim.o.number = true                       -- line numbers
--vim.o.relativenumber = true             -- relative line numbers
vim.o.syntax = true                       -- syntax highlighthing
vim.o.wrap = false                        -- no line wrapping
vim.o.cursorline = true                   -- highlight current line
vim.o.completeopt = menu,menuone,noselect -- completion order
vim.o.signcolumn = 'yes:2'                -- left margin for lsp signs

-- search
vim.o.ignorecase = true                   -- ignore case when searching
vim.o.smartcase = true                    -- use case when typed in search

-- misc
vim.o.backup = false                      -- no backup when overwriting a file
vim.o.writebackup = false                 -- no backup when writing to an existing file
vim.o.swapfile = false                    -- no buffer swap file
vim.o.clipboard = unnamed                 -- use system clipboard

