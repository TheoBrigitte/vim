""" Buffers
" Switch between buffers
map \b  :Buffers<CR>
" Close current buffer
map \x  :bd<CR>

"""" Copy / Paste
"toggle paste mode
"set pastetoggle=\\p
" Replace current word with contents of clipboard
map \o cw<C-r>0<ESC>
" Yank to system clipboard
map Y "+y
" Paste from system clipboard
"map P "+p

"""" Files
" Search files
map \f  :FZF --inline-info<CR>
" Toggle file tree
map \n  :NERDTreeToggle<CR>
" Find current file in file tree
map \m  :NERDTreeFind<CR>

"""" Golang
" Rename symbol
map \r  :GoRename<CR>

"""" Misc
" Reload vim config
map \e :so ~/.vim/vimrc<CR>
" Because we all make typos
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev Qall qall
cnoreabbrev Qall! qall!
" open/close quickfix window
"map \o :copen<CR>
"map \p :cclose<CR>

""" Search
" Search in files with Ack
map \g  :Ack
" Clear search highlighting
map \\  :nohlsearch<CR>

"""" ShellCheck
" Lint current file with ShellCheck
map \s  :ShellCheck!<CR>

""" Tags
" Search tags
map \t  :Tags<CR>
" Toggle tagbar
map \l  :TagbarToggle<CR>

"""" Window management
" Panel navigation
nnoremap <silent> `<Left> :TmuxNavigateLeft<cr>
nnoremap <silent> `<Down> :TmuxNavigateDown<cr>
nnoremap <silent> `<Up> :TmuxNavigateUp<cr>
nnoremap <silent> `<Right> :TmuxNavigateRight<cr>
nnoremap <silent> `<Tab> :TmuxNavigatePrevious<cr>
nnoremap <silent> `h :TmuxNavigateLeft<cr>
nnoremap <silent> `j :TmuxNavigateDown<cr>
nnoremap <silent> `k :TmuxNavigateUp<cr>
nnoremap <silent> `l :TmuxNavigateRight<cr>
" Resize splits
map \<Down> :resize -2<CR>
map \<Up> :resize +2<CR>
map \<Left> :vertical resize -2<CR>
map \<Right> :vertical resize +2<CR>
" Color scheme toggle (light/dark)
map \c  :call Switch_background()<CR>
function! Switch_background()
    if g:colors_name == "base16-tomorrow-night"
        colorscheme base16-tomorrow
    else
        colorscheme base16-tomorrow-night
    endif
endfunction
" Toggle scroll sync between windows
"map \w  :windo set scrollbind<CR>
