" plugin manager

" pathogen
" install plugins with install.sh script
"execute pathogen#infect()

" vim8 native
" install plugins under ~/.vim/pack/whatever/start/
"set packpath+=~/.vim/pack/ " native vim8

" vim-plug
" install plugins with :PlugInstall
call plug#begin('~/.vim/bundle')
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
