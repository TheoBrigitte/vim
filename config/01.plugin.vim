" plugin manager

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
"Plug 'mxw/vim-jsx'
"Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'wsdjeg/vim-fetch'

" auto-completion
"Plug 'valloric/youcompleteme', { 'do': './install.py --go-completer'}
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" themes
Plug 'altercation/vim-colors-solarized'
"Plug 'fatih/molokai'
"Plug 'mhartington/oceanic-next'
call plug#end()
