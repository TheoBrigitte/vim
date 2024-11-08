nnoremap <silent> `<Left> :TmuxNavigateLeft<cr>
nnoremap <silent> `<Down> :TmuxNavigateDown<cr>
nnoremap <silent> `<Up> :TmuxNavigateUp<cr>
nnoremap <silent> `<Right> :TmuxNavigateRight<cr>
nnoremap <silent> `<Tab> :TmuxNavigatePrevious<cr>
nnoremap <silent> `h :TmuxNavigateLeft<cr>
nnoremap <silent> `j :TmuxNavigateDown<cr>
nnoremap <silent> `k :TmuxNavigateUp<cr>
nnoremap <silent> `l :TmuxNavigateRight<cr>

function! Switch_background()
    if g:colors_name == "base16-tomorrow-night"
        colorscheme base16-tomorrow
    else
        colorscheme base16-tomorrow-night
    endif
endfunction

"b for buffers
map \b  :Buffers<CR>
map \c  :call Switch_background()<CR>
"f for files
map \f  :FZF --inline-info<CR>
"t for tags
map \t  :Tags<CR>
"g for grep
map \g  :Ack 
"l for tag list
map \l  :TagbarToggle<CR>
"r for rename
map \r  :GoRename<CR>
map \s  :ShellCheck!<CR>
"n for nerdtree
map \n  :NERDTreeToggle<CR>
map \m  :NERDTreeFind<CR>
map \\  :nohlsearch<CR>
map \x  :bd<CR>
"toggle paste mode
set pastetoggle=\\p
map \o C<C-r>0<ESC>

map Z :qa!<CR>

map Y "+y
"map P "+p

"" no one is really happy until you have this shortcuts
"cnoreabbrev W! w!
"cnoreabbrev Q! q!
"cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
"cnoreabbrev Wa wa
"cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev Qall qall
"map ; :

" open/close quickfix window
"map \o :copen<CR>
"map \p :cclose<CR>

" reload vim config
map \e :so ~/.vim/vimrc<CR>
