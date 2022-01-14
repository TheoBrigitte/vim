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
set laststatus=2
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
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore=["\.git$"]

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
set updatetime=100
"set signcolumn=yes
let g:gitgutter_map_keys = 0
let g:gitgutter_set_sign_backgrounds = 1

" coc
set hidden
set nowritebackup
set cmdheight=2
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

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
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_autosave = 1 "go fmt on save
let g:go_imports_autosave = 1
let g:go_fmt_command = "goimports" "imports rewrite on save
"autocmd FileType go let b:go_fmt_options = {
"\ 'goimports': '-local ' .
"  \ trim(system('{cd '. shellescape(expand('%:h')) .' && go list -m;}')),
"\ }
"let g:go_gocode_propose_builtins = 1 "autocomplete go builtin
"let g:go_gocode_propose_source = 1 "autocomplete from source
let g:go_highlight_functions = 1
let g:go_highlight_functions_arguments = 1
let g:go_highlight_functions_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_build_tags = "k8srequired"
"let g:go_auto_type_info = 1
let g:go_metalinter_enabled = []
"let g:go_fmt_fail_silently = 1
"let g:go_debug = ["lsp"]
let g:go_echo_command_info = 1

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

" youcompleteme
"let g:ycm_collect_identifiers_from_tags_files = 1
"let g:ycm_enable_diagnostic_signs = 0

" deoplete
"let g:deoplete#enable_at_startup = 1
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" autosave
"let g:auto_save = 1
