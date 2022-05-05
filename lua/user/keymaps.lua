-- keymaps.lua

local keymap = require 'lib.utils'.keymap

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

keymap('n', ';', ':')
keymap('n', '<leader>q', ':q<CR>')
keymap('n', '<leader>3', ':noh<CR>')

-- vim
keymap('n', '<leader>ve', ':e $MYVIMRC<CR>')
keymap('n', '<leader>vr', ':source $MYVIMRC<CR>')

-- navigation
keymap('n', '<C-h>', '<C-w><C-h>')
keymap('n', '<C-j>', '<C-w><C-j>')
keymap('n', '<C-k>', '<C-w><C-k>')
keymap('n', '<C-l>', '<C-w><C-l>')
