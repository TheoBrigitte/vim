" plugin manager

" vim-plug
" install plugins with :PlugInstall
call plug#begin('~/.vim/bundle')
Plug 'airblade/vim-gitgutter' "git diff column sign
Plug 'christoomey/vim-tmux-navigator' "navigate vim & tmux panes
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } "golang tools
Plug 'itchyny/lightline.vim' "status line
Plug 'junegunn/fzf.vim' "fuzzy finder (buffers, files, tags)
Plug 'ludovicchabant/vim-gutentags' "auto-generate tags
Plug 'majutsushi/tagbar' "display tags
Plug 'mileszs/ack.vim' "grep in files
"Plug 'mxw/vim-jsx' "reactjs syntax
"Plug 'pangloss/vim-javascript' "javascript syntax
Plug 'scrooloose/nerdtree' "file navigation
"Plug 'SirVer/ultisnips' "code snippets
Plug 'tpope/vim-fugitive' "git integration
Plug 'wsdjeg/vim-fetch' "open file line and column
Plug '907th/vim-auto-save' "auto-save files

" auto-completion
"Plug 'valloric/youcompleteme', { 'do': './install.py --go-completer'}
"Plug 'Shougo/deoplete.nvim'
"Plug 'roxma/nvim-yarp'
"Plug 'roxma/vim-hug-neovim-rpc'

" themes
Plug 'altercation/vim-colors-solarized'
"Plug 'fatih/molokai'
"Plug 'mhartington/oceanic-next'
call plug#end()
