nmap j gj
nmap k gk

nnoremap <silent> `<Left> :TmuxNavigateLeft<cr>
nnoremap <silent> `<Down> :TmuxNavigateDown<cr>
nnoremap <silent> `<Up> :TmuxNavigateUp<cr>
nnoremap <silent> `<Right> :TmuxNavigateRight<cr>
nnoremap <silent> `<Tab> :TmuxNavigatePrevious<cr>

" b for buffers
map \b  :Buffers<CR>
" f for files
map \f  :FZF --inline-info<CR>
" t for tags
map \t  :Tags<CR>
" g for grep
map \g  :Ack 
" l for list
map \l  :TagbarToggle<CR>
" r for rename
map \r  :GoRename<CR>
map \n  :NERDTreeToggle<CR>
map \m  :NERDTreeFind<CR>
map \\  :nohlsearch<CR>
map \x  :bd<CR>

map Z :qa!<CR>
