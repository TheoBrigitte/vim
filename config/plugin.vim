" ack
let g:ackprg = 'rg --vimgrep'

" fzf
"" linux path
set runtimepath+=/usr/bin/fzf
"" osx path
set runtimepath+=/usr/local/opt/fzf
"" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
"" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" gutentags
let g:gutentags_generate_on_empty_buffer = 1


" lightline
set noshowmode
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified', 'bufnum' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'gutentags', 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gutentags': 'gutentags#statusline'
      \ },
      \ }

" NERDtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" tagbar
let g:tagbar_type_go = {
  \ 'ctagstype' : 'go',
  \ 'kinds'     : [
    \ 'p:package',
    \ 'i:imports:1',
    \ 'c:constants',
    \ 'v:variables',
    \ 't:types',
    \ 'n:interfaces',
    \ 'w:fields',
    \ 'e:embedded',
    \ 'm:methods',
    \ 'r:constructor',
    \ 'f:functions'
  \ ],
  \ 'sro' : '.',
  \ 'kind2scope' : {
    \ 't' : 'ctype',
    \ 'n' : 'ntype'
  \ },
  \ 'scope2kind' : {
    \ 'ctype' : 't',
    \ 'ntype' : 'n'
  \ },
  \ 'ctagsbin'  : 'gotags',
  \ 'ctagsargs' : '-sort -silent'
  \ }

" tmux
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 1

" vim-gitgutter
set updatetime=100

" vim-go
"" set guru scope to project root directory.
autocmd VimEnter *
      \ if argc() == 0 && !exists("s:std_in") | let s:file = getcwd() | elseif argc() == 1 && !exists("s:std_in") | let s:file = fnamemodify(argv()[0], ':p:h') | endif
      \| if len(s:file) > 0
      \| let s:tmp = matchlist(s:file, $GOPATH . '/src/\(.\+\)/\?')
      \| if len(s:tmp) > 1 | let s:scope = s:tmp[1] | else | let s:scope = s:file | endif
      \| let g:go_guru_scope = [s:scope]
      \| endif
      \| unlet s:tmp s:file s:scope
"" fmt and imports rewrite on save
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
"" autocomplete
let g:go_gocode_propose_builtins = 1
let g:go_gocode_propose_source = 1
"" highlight
let g:go_highlight_functions = 1
let g:go_highlight_functions_arguments = 1
let g:go_highlight_functions_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
