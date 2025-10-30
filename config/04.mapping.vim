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

nnoremap <leader>w <cmd>w<CR>
nnoremap <leader>Q <cmd>quitall!<CR>

"""" Files
" Search files
nnoremap <leader>f <cmd>FZF --inline-info<cr>
" Toggle file tree
map <leader>n  <cmd>NERDTreeToggle<CR>
" Find current file in file tree
map <leader>m  <cmd>NERDTreeFind<CR>

"""" Git
nnoremap <leader>gf /^<<<<<<<CR>0zt
nnoremap <leader>go dd/^=======<CR>d/^>>>>>>><CR>dd
nnoremap <leader>gt d/^=======<CR>dd/^>>>>>>><CR>dd


"""" Golang
" Rename symbol
nnoremap <leader>R  <cmd>GoRename<CR>
nnoremap <leader>r  <cmd>GoReferrers<CR>
nnoremap <leader>c  <cmd>GoCallers<CR>
nnoremap <leader>do <cmd>GoDoc<CR>
nnoremap <leader>db <cmd>GoDocBrowser<CR>

"""" Misc
" Reload vim config
map <leader>e <cmd>so ~/.vim/vimrc<CR>
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
nnoremap <leader>z <cmd>suspend!<CR>

""" Search
" Search in files
nnoremap <leader>g <cmd>Rg<cr>
" Clear search highlighting
map <leader>\  <cmd>nohlsearch<CR>
" Search in current file
nnoremap <leader>] <cmd>Telescope current_buffer_fuzzy_find<cr>

" Session
" Save current session, restore with: vim -S
nnoremap <leader>S <cmd>mksession!<cr>

"""" ShellCheck
" Lint current file with ShellCheck
map <leader>s  <cmd>ShellCheck!<CR>

""" Tags
" Search tags
nnoremap <leader>t <cmd>Tags<cr>
" Toggle tagbar
map <leader>l  <cmd>TagbarToggle<CR>

"""" Window management
" Panel navigation
nnoremap <silent> `<Left> <cmd>TmuxNavigateLeft<cr>
nnoremap <silent> `<Down> <cmd>TmuxNavigateDown<cr>
nnoremap <silent> `<Up> <cmd>TmuxNavigateUp<cr>
nnoremap <silent> `<Right> <cmd>TmuxNavigateRight<cr>
nnoremap <silent> `<Tab> <cmd>TmuxNavigatePrevious<cr>
nnoremap <silent> `h <cmd>TmuxNavigateLeft<cr>
nnoremap <silent> `j <cmd>TmuxNavigateDown<cr>
nnoremap <silent> `k <cmd>TmuxNavigateUp<cr>
nnoremap <silent> `l <cmd>TmuxNavigateRight<cr>
" Resize splits
map <C-Down> <cmd>resize -2<CR>
map <C-Up> <cmd>resize +2<CR>
map <C-Left> <cmd>vertical resize -2<CR>
map <C-Right> <cmd>vertical resize +2<CR>

" Color scheme toggle (light/dark)
map <leader>C  <cmd>call Switch_background()<CR>
function! Switch_background()
    if g:colors_name == "base16-tomorrow-night"
        colorscheme base16-tomorrow
    else
        colorscheme base16-tomorrow-night
    endif
endfunction
" Toggle scroll sync between windows
"map <leader>w  :windo set scrollbind<CR>
