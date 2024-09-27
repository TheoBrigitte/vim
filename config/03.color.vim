syntax on
filetype plugin indent on

" Load color scheme from current terminal theme
if exists('$BASE16_THEME') && (!exists('g:colors_name') || g:colors_name != 'base16-$BASE16_THEME')
    "let base16colorspace=256
    colorscheme base16-$BASE16_THEME
endif

"set t_ut=
"set t_Co=256
"colorscheme solarized
"colorscheme base16-solarized-dark
"colorscheme base16-onedark
"set background=dark
set termguicolors
"highlight clear SignColumn
highlight Search gui=reverse cterm=reverse

"remove | vertical line separator
"set fillchars=""

"set plain vertical line separator
"hi VertSplit ctermbg=fg ctermfg=fg
