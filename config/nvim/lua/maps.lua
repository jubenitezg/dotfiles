local set_keymap = vim.api.nvim_set_keymap
local g = vim.g

-- Leader map
g.mapleader = ' '

-- Select all
set_keymap('n', '<C-a>', 'gg<ESC>VG', { noremap = true, silent = true })

-- Vim windows
set_keymap('n', 'ss', ':split<CR><C-w>j', { noremap = true, silent = true })
set_keymap('n', 'sv', ':vsplit<CR><C-w>l', { noremap = true, silent = true })

-- Move between windows
set_keymap('n', 's<left>', '<C-w>h', { noremap = true, silent = true })
set_keymap('n', 's<up>', '<C-w>k', { noremap = true, silent = true })
set_keymap('n', 's<down>', '<C-w>j', { noremap = true, silent = true })
set_keymap('n', 's<right>', '<C-w>l', { noremap = true, silent = true })
set_keymap('n', 'sh', '<C-w>h', { noremap = true, silent = true })
set_keymap('n', 'sk', '<C-w>k', { noremap = true, silent = true })
set_keymap('n', 'sj', '<C-w>j', { noremap = true, silent = true })
set_keymap('n', 'sl', '<C-w>l', { noremap = true, silent = true })

-- Close windows
set_keymap('n', 'sc', '<C-w>c', { noremap = true, silent = true }) -- Close current window
set_keymap('n', 'so', '<C-w>o', { noremap = true, silent = true }) -- Close other windows

-- Explorer
set_keymap('n', '<leader>e', ':Ex<CR>', { noremap = true, silent = true })

-- Highlighting
set_keymap('n', '<leader>nh', ':nohl<CR>', { noremap = true, silent = true })

-- Black hole register
set_keymap('n', 'x', '"_x', { noremap = true, silent = true })

