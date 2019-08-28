"clean autocmd (avoid duplicate autocmd commands)
:autocmd!

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
"set list
set listchars=tab:›-,trail:⋅,eol:$
set signcolumn=yes

set nobackup
set nowb
set noswapfile

set backspace=eol,start,indent

"set clipboard=unnamedplus

set splitright
set splitbelow

set viminfo+=n~/.vim/viminfo

set foldmethod=syntax "enable lines folding
set foldlevelstart=99 "do not close any fold on start

set maxmempattern=1200 "fixes out of memory on large files

augroup my-yaml
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
augroup END
