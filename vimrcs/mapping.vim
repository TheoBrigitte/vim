nmap j gj
nmap k gk

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

map \b  :Buffers<CR>
map \f  :FZF --inline-info<CR>
map \t  :Tags<CR>
map \p  :Ack 
map \l  :TagbarToggle<CR>
map \r  :GoRename<CR>
map \n  :NERDTreeToggle<CR>
map \m  :NERDTreeFind<CR>
map \\  :nohlsearch<CR>
map \x  :bd<CR>

map <F12> :qa!<CR>
