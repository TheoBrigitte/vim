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
set listchars=tab:›\ ,trail:⋅

set nobackup
set nowb
set noswapfile

set backspace=eol,start,indent

set clipboard=unamed

set splitright
set splitbelow
