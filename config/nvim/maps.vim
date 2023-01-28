" Leader key map
let mapleader = " "

" Select all
nmap <C-a> gg<S-v>G

" Vim Windows
" ------------------------------------------------
nmap ss :split<CR><C-w>j
nmap sv :vsplit<CR><C-w>l

" Move between windows
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l


" Close windows
map sc <C-w>c " Close current window
map so <C-w>o " Close other windows

" Explorer
map <leader>e :Ex<CR>

" Highlighting
map <leader>nh :nohl<CR>

" Black hole register
noremap x "_x

