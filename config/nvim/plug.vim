if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'cohama/lexima.vim' " Autoclose pairs
Plug 'morhetz/gruvbox'

if has("nvim")
    " Plug 'neoclide/coc.nvim', {'branch': 'release'} " Conquer of Completion
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } " If you have nodejs and yarn
    Plug 'hoob3rt/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'kristijanhusak/defx-icons'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
endif

call plug#end()
