-- keymaps.lua

local keymap = require 'lib.utils'.keymap

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

keymap('n', ';', ':')
keymap('n', '<leader>q', ':q<CR>')
keymap('n', '<leader>3', ':noh<CR>')
keymap('n', '<leader>hf', ':Telescope help_tags<CR>') -- help find

-- vim
keymap('n', '<leader>ve', ':e $MYVIMRC<CR>')
keymap('n', '<leader>vr', ':source $MYVIMRC<CR>')

-- navigation
keymap('n', '<C-h>', '<C-w><C-h>')
keymap('n', '<C-j>', '<C-w><C-j>')
keymap('n', '<C-k>', '<C-w><C-k>')
keymap('n', '<C-l>', '<C-w><C-l>')

-- buffers
keymap('n', '<leader>bh', ':hide<CR>')
keymap('n', '<leader>bk', ':bd<CR>')
keymap('n', '<leader>bp', ':bprevious<CR>')
keymap('n', '<leader>bn', ':bnext<CR>')
keymap('n', '<leader>bb', ':Telescope buffers<CR>') -- buffers

-- windows
keymap('n', '<leader>wv', ':vsplit<CR>')
keymap('n', '<leader>wh', ':split<CR>')

-- git
keymap('n', '<leader>g', ':Neogit<CR>')

-- files
keymap('n', '<leader>ff', ':Telescope find_files<CR>') -- find file
keymap('n', '<leader>fs', ':Telescope live_grep<CR>') -- file search
keymap('n', '<leader>fp', ':Telescope projects<CR>') -- find project
keymap('n', '<leader>fe', ':NvimTreeFindFileToggle<CR>') -- find project

-- notes
keymap('n', '<leader>nf', ':NoteFindFile<CR>') -- find note file
keymap('n', '<leader>ns', ':NoteSearch<CR>') -- find note file
