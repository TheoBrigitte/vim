execute pathogen#infect()

autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

set mouse=a

set number
set relativenumber

set ruler
set incsearch
set ignorecase
set smartcase
set hlsearch
set showcmd

set autoindent
set smartindent

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
