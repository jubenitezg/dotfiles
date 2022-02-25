" Use popup windows for Go Doc
let g:go_doc_popup_window = 1

" Enable lsp for go by using gopls
let g:completor_filetype_map = {}
let g:completor_filetype_map.go = {'ft': 'lsp', 'cmd': 'gopls -remote=auto'}"

" Key Mappings
" Common Go commands
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
" Navigation Commands
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
" Alternate commands
" Alternate between file and test file
au FileType go nmap <Leader>ae <Plug>(go-alternate-edit)
au FileType go nmap <Leader>av <Plug>(go-alternate-vertical)

