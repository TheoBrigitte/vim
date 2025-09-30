" plugin manager

" vim-plug
" install plugins with :PlugInstall
call plug#begin('~/.vim/bundle')

" General
Plug 'airblade/vim-gitgutter' "git diff column sign
Plug 'itchyny/lightline.vim' "status line
"Plug 'ludovicchabant/vim-gutentags' "auto-generate tags
Plug 'preservim/tagbar' "display tags
"Plug 'mxw/vim-jsx' "reactjs syntax
"Plug 'pangloss/vim-javascript' "javascript syntax
"Plug 'SirVer/ultisnips' "code snippets
Plug 'tpope/vim-fugitive' "git integration
Plug 'wsdjeg/vim-fetch' "open file line and column

" Navigation
Plug 'preservim/nerdtree' "file navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' "fuzzy finder (buffers, files, tags)
Plug 'ryanoasis/vim-devicons' "file icons
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'christoomey/vim-tmux-navigator' "navigate vim & tmux panes

" Language support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } "golang tools
Plug 'rust-lang/rust.vim'
Plug 'itspriddle/vim-shellcheck'
Plug 'plasticboy/vim-markdown'
Plug 'mustache/vim-mustache-handlebars' "highlight mustach template

" auto-completion
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'roxma/nvim-yarp'
"Plug 'roxma/vim-hug-neovim-rpc'
"Plug 'valloric/youcompleteme', { 'do': './install.py --go-completer'}
"Plug 'Shougo/deoplete.nvim'
"Plug 'roxma/nvim-yarp'
"Plug 'roxma/vim-hug-neovim-rpc'
Plug 'github/copilot.vim'

" themes
"Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
"Plug 'fatih/molokai'
"Plug 'mhartington/oceanic-next'

call plug#end()
