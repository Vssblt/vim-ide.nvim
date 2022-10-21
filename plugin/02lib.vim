""""""""""""""""""""""""""""""
"This file is hiden config file. 
""""""""""""""""""""""""""""""
set lazyredraw
set wildmenu
set laststatus=3
set showtabline=2
set nu
set relativenumber
set encoding=utf8
set fileencodings=ucs-bom,utf8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set hlsearch 
set showmatch 
set ignorecase
set viminfo='20,\"50000
set timeoutlen=10000
set ttimeoutlen=10
set updatetime=0
set clipboard^=unnamed,unnamedplus
set mouse=v
set t_Co=256
set fillchars=stl:\ 
set backspace=indent,eol,start
set signcolumn=number
set numberwidth=1
set scrolloff=8
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set softtabstop=0
set hidden
set synmaxcol=320    " Normally, the column count will not overtake 180.
set matchpairs+=
"set noequalalways
set signcolumn=yes
let g:localvimrc_ask=0
"let g:localvimrc_persistent=2
let g:localvimrc_sandbox=0

set undofile
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta

aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
aug END

function NoFileCheck()
  if (&buftype == 'nofile')
    setlocal nobuflisted
  endif
endfunction

au BufCreate * call NoFileCheck()

let g:last_buffer = []

"if !isdirectory(g:undoDirPath)
"    call mkdir(g:undoDirPath, "p")
"endif
"
"let &undodir=g:undoDirPath
"
"You can use [Ctrl + x] to complate the code. 
filetype plugin indent on
set completeopt=longest,menu

au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
"packadd termdebug
"autocmd filetype cpp nnoremap <F5> :Termdebug<CR> <c-w>2j<c-w>L

""""""""""""""""""""""""""""""
" vim-interestingwords settings
""""""""""""""""""""""""""""""
let g:interestingWordsDefaultMappings = 0
let g:interestingWordsRandomiseColors = 1
let g:interestingWordsTermColors = ['154', '121', '211', '137', '214', '222', '1', '2', '3', '4', '6', '64', '99' ]

""""""""""""""""""""""""""""""
" ranger settings
""""""""""""""""""""""""""""""
let g:ranger_map_keys = 0

""""""""""""""""""""""""""""""
" coc settings
""""""""""""""""""""""""""""""
"autocmd CursorHold * silent call CocActionAsync('highlight')

""""""""""""""""""""""""""""""
" other settings
""""""""""""""""""""""""""""""
function! Load_vvimrc(path)
    let l:all_path = SplitPath(a:path)
    
    for p in l:all_path
        let l:current_vvimrc = p.'/'.g:vvimrc_name
  if p == '/'
          let l:current_vvimrc = p.g:vvimrc_name
  endif
        if filereadable(l:current_vvimrc) 
            execute 'source' l:current_vvimrc
            echo l:current_vvimrc." add"
        endif
    endfor
    
endfunction

function! SplitPath(path)
    let l:start = 0
    let l:list = []
    
    while 1 == 1
        let l:idx = stridx(a:path, '/', l:start)
        let l:start = l:idx + 1
        
        if l:idx == -1
            break
        endif
        
        let l:part = a:path[0:(l:idx > 0 ? l:idx - 1 : l:idx)]
        call add(l:list, l:part)
    endwhile
    
    if strridx(a:path, '/') != strlen(a:path) - strlen('/')
        call add(l:list, a:path)
    endif
    
    return l:list
endfunction

call Load_vvimrc(expand("%:p:h"))


execute ":command! VConfig :e " g:plugindir.'/plugin/01config.vim'
execute ":command! VHConfig :e " g:plugindir.'/plugin/02lib.vim'
execute ":command! Vlua :e " g:plugindir.'/lua/ide-lib.lua'
execute ":command! VPlugList :e " '~/.config/nvim/init.lua'
execute ":command! DvorakSettingsV :e " g:plugindir.'/plugin/03map.vim'
execute "command! Bda :bufdo bwipeout"

command! -nargs=0 FHide FloatermHide
command! -nargs=0 FNext FloatermNext
command! -nargs=0 FFirst FloatermFirst
command! -nargs=0 FKill FloatermKill
command! -nargs=0 FLast FloatermLast
command! -nargs=0 FPrev FloatermPrev
command! -nargs=0 FShow FloatermShow

if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
"  set signcolumn=number
else
"  set signcolumn=yes
endif

""""""""""""""""""""""""""""""
" vim-surround
""""""""""""""""""""""""""""""
let g:surround_no_mappings = 1

""""""""""""""""""""""""""""""
" vim-dispatch
""""""""""""""""""""""""""""""
let g:dispatch_quickfix_height=20
let g:dispatch_tmux_height=20


""""""""""""""""""""""""""""""
" LookupFile
""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 2
let g:LookupFile_PreservePatternHistory = 1
let g:LookupFile_AlwaysAcceptFirst = 1
let g:LookupFile_PreserveLastPattern = 0


""""""""""""""""""""""""""""""
" orther
""""""""""""""""""""""""""""""
if filereadable(g:plugindir."/plugin/04tempConfig.vim")
    execute ':source' g:plugindir."/plugin/04tempConfig.vim"
endif

""""""""""""""""""""""""""""""
" vim-glaive settings
""""""""""""""""""""""""""""""
let g:myplugin_enablefeature = 1
let g:myplugin_defaultdir = $HOME
let g:myplugin_weirdmode = 'm'

""""""""""""""""""""""""""""""
" fzf.vim settings
""""""""""""""""""""""""""""""
let g:fzf_preview_window = ['up:80%:hidden', 'ctrl-/']
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.75 } } 
let g:clockn_enable = 1
let g:clockn_color = '#000000'
let g:clockn_winblend = 100
highlight ClockNormal guifg=#000000
let g:clockn_to_top = 1
let g:clockn_to_right = 1

""""""""""""""""""""""""""""""
" quick-scope settings
""""""""""""""""""""""""""""""
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END
let g:qs_hi_priority = 2
let g:qs_max_chars=160
let g:qs_delay = 40

""""""""""""""""""""""""""""""
" common settings
""""""""""""""""""""""""""""""
autocmd VimEnter * :highlight EndOfBuffer ctermfg=bg


let g:fcitx5_remote='/usr/bin/fcitx5-remote'
let g:termdebug_useFloatingHover=1


""""""""""""""""""""""""""""""
" vim-lsp-cxx-highlight
""""""""""""""""""""""""""""""
au BufEnter * call HightlightCheck()
function HightlightCheck()
  if (line('$') > 2000)
    execute('LspCxxHighlightDisable')
  else
    execute('LspCxxHighlight')
  endif
endfunction

""""""""""""""""""""""""""""""
" nvim-treesitter
""""""""""""""""""""""""""""""
function LoadTreeSitterSettings()
  lua require("ide-lib")
endfunction

autocmd VimEnter * call LoadTreeSitterSettings()


""""""""""""""""""""""""""""""
" aerial.nvim
""""""""""""""""""""""""""""""
function LoadAerialSettings()
lua require("aerial").setup({ backends = { "treesitter", "lsp", "markdown" }, close_behavior = "auto", default_bindings = true, default_direction = "prefer_left", disable_max_lines = 10000, disable_max_size = 2000000, filter_kind = { "Class", "Constructor", "Enum", "Function", "Interface", "Module", "Method", "Struct", }, highlight_mode = "split_width", highlight_closest = true, highlight_on_hover = false, highlight_on_jump = 300, icons = {}, ignore = { unlisted_buffers = true, filetypes = {}, buftypes = "special", wintypes = "special", }, link_folds_to_tree = false, link_tree_to_folds = true, manage_folds = false, max_width = { 40, 0.2 }, width = nil, min_width = 20, nerd_font = "auto", on_attach = nil, on_first_symbols = nil, open_automatic = false, placement_editor_edge = false, post_jump_cmd = "normal! zz", close_on_select = false, show_guides = false, update_events = "TextChanged,InsertLeave", guides = { mid_item = "├─", last_item = "└─", nested_top = "│ ", whitespace = "  ", }, float = { border = "rounded", relative = "cursor", max_height = 0.9, height = nil, min_height = { 8, 0.1 }, override = function(conf) return conf end, }, lsp = { diagnostics_trigger_update = true, update_when_errors = true, update_delay = 300, }, treesitter = { update_delay = 300, }, markdown = { update_delay = 300, }, })
endfunction

autocmd VimEnter * call LoadAerialSettings()

""""""""""""""""""""""""""""""
" vim-dap
""""""""""""""""""""""""""""""
comm! -nargs=? DC lua require('dapui').close(); require('dap').terminate(); require('dap').repl.close(); require('dap').disconnect();
au FileType dap-repl lua require('dap.ext.autocompl').attach()
