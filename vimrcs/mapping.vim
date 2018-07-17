nmap j gj
nmap k gk

"nmap <silent> <A-Up> :wincmd k<CR>
"nmap <silent> <A-Down> :wincmd j<CR>
"nmap <silent> <A-Left> :wincmd h<CR>
"nmap <silent> <A-Right> :wincmd l<CR>

nnoremap <silent> `h :TmuxNavigateLeft<cr>
nnoremap <silent> `j :TmuxNavigateDown<cr>
nnoremap <silent> `k :TmuxNavigateUp<cr>
nnoremap <silent> `l :TmuxNavigateRight<cr>
nnoremap <silent> `b :TmuxNavigatePrevious<cr>

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

map <F12> :qa!<CR>
