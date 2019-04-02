" clean autocmd (avoid duplicate autocmd commands)
:autocmd!

" load plugins
execute pathogen#infect()

set mouse=a

set number
set relativenumber

set ruler
set incsearch
set ignorecase
set smartcase
set hlsearch
set showcmd

set tabstop=8
set expandtab
set shiftwidth=4
set autoindent
set smartindent
filetype plugin indent on

set encoding=utf8
set ffs=unix,dos,mac
set list
set listchars=tab:›\ ,trail:⋅
set signcolumn=yes

set nobackup
set nowb
set noswapfile

set backspace=eol,start,indent

"set clipboard=unnamedplus

set splitright
set splitbelow

set viminfo+=n~/.vim/viminfo

set foldmethod=syntax
set foldlevelstart=99

" out of memory on large files
set maxmempattern=1200
