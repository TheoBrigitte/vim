" ack
let g:ackprg = 'rg --vimgrep'

" fzf
set runtimepath+=/usr/bin/fzf "fzf path on linux
set runtimepath+=/usr/local/opt/fzf "fzf path on osx
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0) "use ripgrep instead of ag:
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0) "files command with preview window

" gutentags
let g:gutentags_generate_on_empty_buffer = 1
let g:gutentags_cache_dir = '~/.cache/vim_gutentags'

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
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif "open NERDTree on start
autocmd VimEnter * wincmd l "move cursor to main window on start
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeMinimalUI = 1

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

" utils snips
let g:UltiSnipsExpandTrigger="<c-space>"

" vim-gitgutter
"set updatetime=100
"set signcolumn=yes

" vim-go
autocmd VimEnter *
      \ let s:file = ""
      \| if argc() == 0 && !exists("s:std_in") | let s:file = getcwd() | elseif argc() == 1 && !exists("s:std_in") | let s:file = fnamemodify(argv()[0], ':p:h') | endif
      \| if len(s:file) > 0
      \| let s:tmp = matchlist(s:file, $GOPATH . '/src/\(.\+\)/\?')
      \| if len(s:tmp) > 1 | let s:scope = s:tmp[1] | else | let s:scope = s:file | endif
      \| let g:go_guru_scope = [s:scope]
      \| unlet s:tmp s:scope
      \| endif
      \| unlet s:file "set guru scope to project root directory
let g:go_fmt_autosave = 1 "go fmt on save
let g:go_fmt_command = "goimports" "imports rewrite on save
let g:go_gocode_propose_builtins = 1 "autocomplete go builtin
let g:go_gocode_propose_source = 1 "autocomplete from source
let g:go_highlight_functions = 1
let g:go_highlight_functions_arguments = 1
let g:go_highlight_functions_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_build_tags = "k8srequired"
let g:go_auto_type_info = 1

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

" youcompleteme
let g:ycm_collect_identifiers_from_tags_files = 1
