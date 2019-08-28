" plugin manager

" pathogen
" use the install.sh script to install plugins
"execute pathogen#infect()

" vim8 native
"
"set packpath+=~/.vim/pack/ " native vim8
call plug#begin('~/.vim/bundle') " vim-plug
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'valloric/youcompleteme', { 'do': './install.py --go-completer'}
Plug 'wsdjeg/vim-fetch'

Plug 'altercation/vim-colors-solarized'
"Plug 'fatih/molokai'
"Plug 'mhartington/oceanic-next'
call plug#end()
