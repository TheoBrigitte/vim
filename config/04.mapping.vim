""" Buffers
" Switch between buffers
nnoremap <leader>b <cmd>Buffers<cr>
" Close current buffer
nnoremap <leader>x :bp\|bd #<CR>

"""" Copy / Paste
"toggle paste mode
"set pastetoggle=\\p
" Replace current word with contents of clipboard
map <leader>o cw<C-r>0<ESC>
" Yank to system clipboard
map Y "+y
" Paste from system clipboard
map <leader>p "+p

nnoremap <leader>w :w<CR>
nnoremap <leader>Q :quitall!<CR>

"""" Files
" Search files
nnoremap <leader>f <cmd>FZF --inline-info<cr>
" Toggle file tree
map <leader>n  :NERDTreeToggle<CR>
" Find current file in file tree
map <leader>m  :NERDTreeFind<CR>

"""" Git
nnoremap <leader>gf /^<<<<<<<CR>0zt
nnoremap <leader>go dd/^=======<CR>d/^>>>>>>><CR>dd
nnoremap <leader>gt d/^=======<CR>dd/^>>>>>>><CR>dd


"""" Golang
" Rename symbol
nnoremap <leader>R  :GoRename<CR>
nnoremap <leader>r  :GoReferrers<CR>
nnoremap <leader>c  :GoCallers<CR>
nnoremap <leader>do :GoDoc<CR>
nnoremap <leader>db :GoDocBrowser<CR>

"""" Misc
" Reload vim config
map <leader>e :so ~/.vim/vimrc<CR>
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
"map <leader>o :copen<CR>
"map <leader>p :cclose<CR>
nnoremap <leader>z :suspend!<CR>

""" Search
" Search in files
nnoremap <leader>g <cmd>Rg<cr>
" Clear search highlighting
map <leader>\  :nohlsearch<CR>
" Search in current file
nnoremap <leader>] <cmd>Telescope current_buffer_fuzzy_find<cr>

"""" ShellCheck
" Lint current file with ShellCheck
map <leader>s  :ShellCheck!<CR>

""" Tags
" Search tags
nnoremap <leader>t <cmd>Tags<cr>
" Toggle tagbar
map <leader>l  :TagbarToggle<CR>

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
map <C-Down> :resize -2<CR>
map <C-Up> :resize +2<CR>
map <C-Left> :vertical resize -2<CR>
map <C-Right> :vertical resize +2<CR>

" Color scheme toggle (light/dark)
map <leader>C  :call Switch_background()<CR>
function! Switch_background()
    if g:colors_name == "base16-tomorrow-night"
        colorscheme base16-tomorrow
    else
        colorscheme base16-tomorrow-night
    endif
endfunction
" Toggle scroll sync between windows
"map <leader>w  :windo set scrollbind<CR>
