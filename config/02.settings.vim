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

set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
filetype plugin indent on

set encoding=utf-8
set ffs=unix,dos,mac
"set list
set listchars=tab:›-,trail:⋅,eol:$

set nobackup
set nowb
set noswapfile

set backspace=eol,start,indent

"set clipboard=unnamedplus

set splitright
set splitbelow

if has('nvim')
    set viminfo+=n~/.vim/shada
else
    set viminfo+=n~/.vim/viminfo
endif

set foldmethod=syntax "enable lines folding
set foldlevelstart=99 "do not close any fold on start

set maxmempattern=1200 "fixes out of memory on large files

augroup my-yaml
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
augroup END

" Persistent undo.
set undofile
set undodir=~/.vim/undo
