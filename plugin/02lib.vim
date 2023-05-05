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
set mouse=a
set t_Co=256
set fillchars=stl:\ 
set backspace=indent,eol,start
set numberwidth=1
set scrolloff=8
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set smartcase
set softtabstop=0
set hidden
set synmaxcol=320    " Normally, the column count will not overtake 180.
set matchpairs+=
set updatetime=300

augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

if has('termguicolors')
  set termguicolors
endif
set signcolumn=yes
let g:localvimrc_ask=0
let g:localvimrc_sandbox=0
autocmd FileType qf wincmd J
autocmd FileType fzf setlocal signcolumn=no
set undofile
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
filetype plugin indent on
set completeopt=longest,menu
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta ctermfg=lightblue guifg=#505080 guibg=#C06060

""""""""""""""""""""""""""""""
" vim-interestingwords settings
""""""""""""""""""""""""""""""
let g:interestingWordsDefaultMappings = 0
let g:interestingWordsRandomiseColors = 1
let g:interestingWordsTermColors = ['154', '121', '211', '137', '214', '222', '1', '2', '3', '4', '6', '64', '99' ]
let g:interestingWordsGUIColors = ['#f85e84', '#ef9062', '#e5c463', '#7accd7', '#ab9df2' ]

""""""""""""""""""""""""""""""
" ranger settings
""""""""""""""""""""""""""""""
let g:ranger_map_keys = 0

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
" clock settings
""""""""""""""""""""""""""""""
let g:clockn_enable = 1
let g:clockn_color = '#000000'
let g:clockn_winblend = 100
highlight ClockNormal guifg=#000000
let g:clockn_to_top = 1
let g:clockn_to_right = 1

""""""""""""""""""""""""""""""
" quick-scope settings
""""""""""""""""""""""""""""""
highlight QuickScopePrimary guifg=#afff5f ctermfg=155 ctermbg=235
highlight QuickScopeSecondary guifg=#5fffff ctermfg=81 ctermbg=235

augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg=#afff5f ctermfg=155 ctermbg=235
  autocmd ColorScheme * highlight QuickScopeSecondary guifg=#5fffff ctermfg=81 ctermbg=235
augroup END
let g:qs_hi_priority = 2
let g:qs_max_chars=160
let g:qs_lazy_highlight = 1
let g:qs_delay = 40

""""""""""""""""""""""""""""""
" common settings
""""""""""""""""""""""""""""""

highlight EndOfBuffer ctermfg=bg guifg=#2d2a2e guibg=#2d2a2e

augroup NrHighlight
  autocmd!
  
  autocmd VimEnter,WinEnter,BufWinEnter * :highlight Normal ctermfg=250 ctermbg=235 guifg=#d3d1d4 guibg=#252226
  autocmd WinLeave * :highlight Normal ctermfg=250 ctermbg=235 guifg=#d3d1d4 guibg=#2d2a2e
augroup END

highlight CursorLine ctermbg=236 guibg=#352F35

let g:fcitx5_remote='/usr/bin/fcitx5-remote'
let g:termdebug_useFloatingHover=1

""""""""""""""""""""""""""""""
" vim-diff-enhanced
""""""""""""""""""""""""""""""
" started In Diff-Mode set diffexpr (plugin not loaded yet)
if &diff
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
endif

""""""""""""""""""""""""""""""
" vim-template
" Requires: sudo apt install ruby-licensee
""""""""""""""""""""""""""""""
let g:email = "sunruiyangcp01@gmail.com"
let g:username = "Vincent Sun"
let g:templates_detect_git = 1

""""""""""""""""""""""""""""""
" aerial.nvim
""""""""""""""""""""""""""""""
hi link AerialLine QuickFixLine
hi QuickFixLine guibg=#848089 guifg=black
hi AerialLine guibg=#848089 guifg=black
hi AerialLineNC guibg=#848089
lua require("ide-lib")

hi link AerialLine QuickFixLine
hi QuickFixLine guibg=#848089 guifg=black
hi AerialLine guibg=#848089 guifg=black
hi AerialLineNC guibg=#848089

""""""""""""""""""""""""""""""
" mzlogin/vim-markdown-toc
""""""""""""""""""""""""""""""
autocmd FileType markdown command! TOC :GenTocGFM

""""""""""""""""""""""""""""""
" markdown-preview.nvim
""""""""""""""""""""""""""""""
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 1

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" for path with space
" valid: `/path/with\ space/xxx`
" invalid: `/path/with\\ space/xxx`
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or empty for random
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" set default theme (dark or light)
" By default the theme is define according to the preferences of the system
let g:mkdp_theme = 'dark'

let g:vim_markdown_folding_disabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""
" nvim-cmp
""""""""""""""""""""""""""""""""""""""""""""""""
" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! link CmpItemKindInterface CmpItemKindVariable
highlight! link CmpItemKindText CmpItemKindVariable
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! link CmpItemKindMethod CmpItemKindFunction
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! link CmpItemKindProperty CmpItemKindKeyword
highlight! link CmpItemKindUnit CmpItemKindKeyword
