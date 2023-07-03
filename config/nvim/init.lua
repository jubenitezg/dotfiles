local opt = vim.opt
local g = vim.g
local cmd = vim.cmd
local fn = vim.fn
local create_cmd = vim.api.nvim_create_user_command

------------------- Options -------------------
opt.compatible = false
opt.showmatch = true
opt.ignorecase = true
opt.mouse = 'a'
opt.incsearch = true

--- Indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.autoindent = true

opt.number = true
opt.relativenumber = true
-- opt.clipboard='unnamedplus'
opt.ttyfast = true
opt.swapfile = false
opt.splitright = true
opt.splitbelow = true
opt.encoding = 'utf-8'
opt.title = true
opt.shell = 'zsh'
opt.updatetime = 100

cmd('filetype plugin indent on')

--- Highlight
opt.cursorline = true
opt.hlsearch = true
cmd('syntax on')

-------------------------------------------------


------------------- Syntax theme -------------------
opt.cursorline = true
g.gruvbox_contrast_dark = 'soft'
g.gruvbox_transparent_bg = 1
if fn.exists('&termguicolors') then
  opt.termguicolors = true
end

cmd('autocmd vimenter * ++nested colorscheme gruvbox')
cmd('autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE')

cmd('autocmd BufNewFile,BufRead *.pcf set syntax=pascal')
----------------------------------------------------

------------------- Commands -------------------
create_cmd('PackerInstall', function()
  cmd [[packadd packer.nvim]]
  require('plug').install()
end, {})
create_cmd('PackerUpdate', function()
  cmd [[packadd packer.nvim]]
  require('plug').update()
end, {})
create_cmd('PackerSync', function()
  cmd [[packadd packer.nvim]]
  require('plug').sync()
end, {})
create_cmd('PackerClean', function()
  cmd [[packadd packer.nvim]]
  require('plug').clean()
end, {})
create_cmd('PackerCompile', function()
  cmd [[packadd packer.nvim]]
  require('plug').compile()
end, {})
------------------------------------------------


------------------- Imports -------------------
require('maps')
-----------------------------------------------

