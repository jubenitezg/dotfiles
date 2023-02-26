set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching
set ignorecase              " case insensitive
set mouse=v                 " middle-click paste with
set incsearch               " incremental search
set tabstop=2               " number of columns occupied by a tab 
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2           " width for autoindents
set smartindent
set autoindent              " indent a new line the same amount as the line just typed
set number relativenumber   " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=120                  " set an 120 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
set mouse=a                 " enable mouse click
" set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
set noswapfile              " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
set splitright
set splitbelow
scriptencoding utf-8
set title
set shell=zsh
set updatetime=100 

" Highlight
" ---------------------------------------------------------------------
set cursorline              " highlight current cursorline
set hlsearch                " highlight search 
syntax on                   " syntax highlighting
" ---------------------------------------------------------------------

" Imports 
" ---------------------------------------------------------------------
runtime ./plug.vim
if has("unix")
    let s:uname = system("uname -s")
endif

runtime ./maps.vim
" ---------------------------------------------------------------------


" Syntax theme 
" ---------------------------------------------------------------------
" true color
let g:gruvbox_contrast_dark='soft'
let g:gruvbox_transparent_bg=1
if exists("&termguicolors")
  set termguicolors
endif
autocmd vimenter * ++nested colorscheme gruvbox
autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE

" extra
autocmd BufNewFile,BufRead *.pfc set syntax=pascal
"
