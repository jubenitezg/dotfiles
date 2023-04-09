local g = vim.g
local cmd = vim.cmd

-- Use popup windows for Go Doc
g.go_doc_popup_window = 1

-- Enable lsp for go by using gopls
g.completor_filetype_map = {}
g.completor_filetype_map.go = {ft = 'lsp', cmd = 'gopls -remote=auto'}

-- Key Mappings
-- Common Go cmds
cmd("autocmd FileType go nmap <leader>r <Plug>(go-run)")
cmd("autocmd FileType go nmap <leader>b <Plug>(go-build)")
cmd("autocmd FileType go nmap <leader>t <Plug>(go-test)")
cmd("autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)")
cmd("autocmd FileType go nmap <Leader>e <Plug>(go-rename)")
cmd("autocmd FileType go nmap <Leader>s <Plug>(go-implements)")
cmd("autocmd FileType go nmap <Leader>i <Plug>(go-info)")
-- Navigation cmds
cmd("autocmd FileType go nmap <Leader>ds <Plug>(go-def-split)")
cmd("autocmd FileType go nmap <Leader>dv <Plug>(go-def-vertical)")
-- Alternate cmds
-- Alternate between file and test file
cmd("autocmd FileType go nmap <Leader>ae <Plug>(go-alternate-edit)")
cmd("autocmd FileType go nmap <Leader>av <Plug>(go-alternate-vertical)")

