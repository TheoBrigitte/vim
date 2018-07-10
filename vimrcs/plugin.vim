execute pathogen#infect()

" CtrlP
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_extensions = ['tag']

" fzf
set runtimepath+=/usr/bin/fzf

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['errcheck', 'go']

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_functions_arguments = 1
let g:go_highlight_functions_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1

" ack
let g:ackprg = 'ag --vimgrep'
