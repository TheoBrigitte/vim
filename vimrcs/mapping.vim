nmap j gj
nmap k gk

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

map <C-l> :TagbarToggle<CR>
map <C-m> :GoRename<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-_> :nohlsearch<CR>

map <F2> :FZF --inline-info<CR>
map <F3> :Ag 
map <F4> :Tags<CR>

map <F12> :qa!<CR>
