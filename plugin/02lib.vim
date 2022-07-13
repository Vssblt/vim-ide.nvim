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
set synmaxcol=180    " Normally, the column count will not overtake 180.
set matchpairs+=
set noequalalways
let g:localvimrc_ask=0
"let g:localvimrc_persistent=2
let g:localvimrc_sandbox=0

set undofile
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta

aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
aug END

au BufEnter * call execute("setlocal winbar=" . expand('%:t'))

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
let g:interestingWordsTermColors = ['154', '121', '211', '137', '214', '222', '1', '2', '3', '4', '6', '64', '99']

""""""""""""""""""""""""""""""
" ranger settings
""""""""""""""""""""""""""""""
let g:ranger_map_keys = 0

""""""""""""""""""""""""""""""
" vim-devicons settings
""""""""""""""""""""""""""""""`
"adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1

"adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1

"set highlight cached
let g:airline_highlighting_cache = 1


""""""""""""""""""""""""""""""
" airline settings
""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0 ',
       \ '1': '1 ',
       \ '2': '2 ',
       \ '3': '3 ',
       \ '4': '4 ',
       \ '5': '5 ',
       \ '6': '6 ',
       \ '7': '7 ',
       \ '8': '8 ',
       \ '9': '9 '
       \}
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_powerline_fonts=1
let g:airline_symbols.linenr = "CL" " current line
let g:airline_symbols.whitespace = '|'
let g:airline_symbols.maxlinenr = 'Ml' "maxline
let g:airline_symbols.branch = 'BR'
let g:airline_symbols.readonly = "RO"
let g:airline_symbols.dirty = "DT"
let g:airline_symbols.crypt = "CR"
"let g:airline_extensions = []

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
lua require("aerial").setup({ backends = { "treesitter", "lsp", "markdown" }, close_behavior = "auto", default_bindings = true, default_direction = "prefer_right", disable_max_lines = 10000, disable_max_size = 2000000, filter_kind = { "Class", "Constructor", "Enum", "Function", "Interface", "Module", "Method", "Struct", }, highlight_mode = "split_width", highlight_closest = true, highlight_on_hover = false, highlight_on_jump = 300, icons = {}, ignore = { unlisted_buffers = true, filetypes = {}, buftypes = "special", wintypes = "special", }, link_folds_to_tree = false, link_tree_to_folds = true, manage_folds = false, max_width = { 40, 0.2 }, width = nil, min_width = 10, nerd_font = "auto", on_attach = nil, on_first_symbols = nil, open_automatic = false, placement_editor_edge = false, post_jump_cmd = "normal! zz", close_on_select = false, show_guides = false, update_events = "TextChanged,InsertLeave", guides = { mid_item = "├─", last_item = "└─", nested_top = "│ ", whitespace = "  ", }, float = { border = "rounded", relative = "cursor", max_height = 0.9, height = nil, min_height = { 8, 0.1 }, override = function(conf) return conf end, }, lsp = { diagnostics_trigger_update = true, update_when_errors = true, update_delay = 300, }, treesitter = { update_delay = 300, }, markdown = { update_delay = 300, }, })
endfunction

autocmd VimEnter * call LoadAerialSettings()

""""""""""""""""""""""""""""""
" vim-dap close
""""""""""""""""""""""""""""""
comm! -nargs=? DC lua require('dapui').close(); require('dap').terminate(); require('dap').repl.close(); require('dap').disconnect();

"
"function Scrolloff_eof()
"  if (g:x < winwidth("%"))
"    return 
"  endif
"  let l:lines = winwidth("%")
"  let l:lines = l:lines / 5 * 2
"  call feedkeys( l:lines . "\<c-e>")
"endfunction
"
"function! CopyAppend()
"	if g:with_x11 == 1
"		let @*=@*.getline('.')."\n"
"	else
"		let @" .= getline('.')."\n"
"	endif
"endfunction
"
"function! CutAppend()
"	if g:with_x11 == 1
"		let @*=@*.getline('.')."\n"
"	else
"		let @" .= getline('.')."\n"
"	endif
"	execute "delete _"
"endfunction
"
"function TermInit()
"  setlocal nonu
"  setlocal norelativenumber
"  startinsert
"endfunc
"
"autocmd TermEnter * call TermEnter()
"function TermEnter()
"  call rainbow#disable()
"  if g:qs_enable == 1
"    call quick_scope#Toggle()
"  endif
"  startinsert
"endfunc
"
"autocmd TermLeave * call TermLeave()
"
"function TermLeave()
"  call rainbow#enable()
"  if g:qs_enable == 0
"    call quick_scope#Toggle()
"  endif
"endfunc
"
"function BufEnter()
"  let l:bufname=bufname("%")
"  let l:bufwinnr = bufwinnr(bufname)
"  if (exists("g:TagList_title") && l:bufname == g:TagList_title)
"    if (exists("g:TagList_showNum") && g:TagList_showNum == 1)
"      setlocal nu
"    else
"      setlocal nonu
"    endif
"    if (exists("g:TagList_showRelativeNumber") && g:TagList_showRelativeNumber == 1)
"      setlocal relativenumber
"    else
"      setlocal norelativenumber
"    endif
"    call rainbow#disable()
"  endif
"endfunc
"
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~ '\s'
"endfunction
"
"function! GetBufferList()
"  redir =>buflist
"  silent! ls!
"  redir END
"  return buflist
"endfunction
"
"function! ToggleList(bufname, pfx)
"  let buflist = GetBufferList()
"  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
"    if bufwinnr(bufnum) != -1
"      exec(a:pfx.'close')
"      return
"    endif
"  endfor
"  if a:pfx == 'l' && len(getloclist(0)) == 0
"      echohl ErrorMsg
"      echo "Location List is Empty."
"      return
"  endif
"  let winnr = winnr()
"  exec(a:pfx.'open')
"  if winnr() != winnr
"    wincmd p
"  endif
"endfunction
"
"function! g:Start_Termdebug(arg)
"	if v:shell_error == 0
"		execute "Termdebug " . a:arg
"	endif
"endfunction
"function NewtabTerminal()
"  tabnew
"  execute("terminal")
"endfunction
"
"autocmd BufEnter * call BufEnter()
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"autocmd TermOpen * call TermInit()
"comm! -nargs=? -bang A CocCommand clangd.switchSourceHeader
"comm! -nargs=? -bang AS CocCommand clangd.switchSourceHeader split
"comm! -nargs=? -bang AV CocCommand clangd.switchSourceHeader vsplit
"let g:VM_default_mappings = 0
"let g:VM_leader = ','
"let g:VM_maps = {}
"let g:VM_custom_remaps = {'s' : 'l', ',d' : 'k', ',-' : 'j', '<c-a>' : '<leader>A', 'b':'c'}
"
"let g:VM_maps['Find Under']                  = '<c-l>'
"let g:VM_maps['Find Subword Under']          = '<c-l>'
"let g:VM_maps["Select All"]                  = '<leader>A' 
"let g:VM_maps["Start Regex Search"]          = '\/'
"let g:VM_maps["Add Cursor Down"]             = '<C-Down>'
"let g:VM_maps["Add Cursor Up"]               = '<C-Up>'
"let g:VM_maps["Add Cursor At Pos"]           = '\\'
"
"let g:VM_maps["Visual Regex"]                = '\/'
"let g:VM_maps["Visual All"]                  = '\A' 
"let g:VM_maps["Visual Add"]                  = '\a'
"let g:VM_maps["Visual Find"]                 = '\f'
"let g:VM_maps["Visual Cursors"]              = '\c'
"let g:VM_maps["Select Cursor Down"]          = '<M-C-Down>'
"let g:VM_maps["Select Cursor Up"]            = '<M-C-Up>'
"
"let g:VM_maps["Erase Regions"]               = '\gr'
"
"let g:VM_maps["Mouse Cursor"]                = '<C-LeftMouse>'
"let g:VM_maps["Mouse Word"]                  = '<C-RightMouse>'
"let g:VM_maps["Mouse Column"]                = '<M-C-RightMouse>'
"let g:VM_maps["Switch Mode"]                 = '<Tab>'
"
"let g:VM_maps["Find Next"]                   = ']'
"let g:VM_maps["Find Prev"]                   = '['
"let g:VM_maps["Goto Next"]                   = '}'
"
"let g:VM_maps["Goto Prev"]                   = '{'
"let g:VM_maps["Seek Next"]                   = '<C-f>'
"let g:VM_maps["Seek Prev"]                   = '<C-b>'
"let g:VM_maps["Skip Region"]                 = 'q'
"let g:VM_maps["Remove Region"]               = 'Q'
"let g:VM_maps["Invert Direction"]            = 'o'
"let g:VM_maps["Find Operator"]               = "m"
"let g:VM_maps["Surround"]                    = 'S'
"let g:VM_maps["Replace Pattern"]             = 'R'
"
"let g:VM_maps["Tools Menu"]                  = '\`'
"let g:VM_maps["Show Registers"]              = '\"'
"let g:VM_maps["Case Setting"]                = '\c'
"let g:VM_maps["Toggle Whole Word"]           = '\w'
""let g:VM_maps["Transpose"]                   = '\t'
"let g:VM_maps["Align"]                       = '\a'
"let g:VM_maps["Duplicate"]                   = '\d'
"let g:VM_maps["Rewrite Last Search"]         = '\r'
"let g:VM_maps["Merge Regions"]               = '\m'
"let g:VM_maps["Split Regions"]               = '\s'
"let g:VM_maps["Remove Last Region"]          = '\q'
"let g:VM_maps["Visual Subtract"]             = '\s'
"let g:VM_maps["Case Conversion Menu"]        = '\C'
"let g:VM_maps["Search Menu"]                 = '\S'
"
"let g:VM_maps["Run Normal"]                  = '\z'
"let g:VM_maps["Run Last Normal"]             = '\Z'
"let g:VM_maps["Run Visual"]                  = '\v'
"let g:VM_maps["Run Last Visual"]             = '\V'
"let g:VM_maps["Run Ex"]                      = '\'
"let g:VM_maps["Run Last Ex"]                 = '\'
"let g:VM_maps["Run Macro"]                   = '\@'
"let g:VM_maps["Align Char"]                  = '\<'
"let g:VM_maps["Align Regex"]                 = '\>'
"let g:VM_maps["Numbers"]                     = '\n'
"let g:VM_maps["Numbers Append"]              = '\N'
"let g:VM_maps["Zero Numbers"]                = '\0n'
"let g:VM_maps["Zero Numbers Append"]         = '\0N'
"let g:VM_maps["Shrink"]                      = "\-"
"let g:VM_maps["Enlarge"]                     = "\+"
"
"let g:VM_maps["Toggle Block"]                = '\<BS>'
"let g:VM_maps["Toggle Single Region"]        = '\<CR>'
"let g:VM_maps["Toggle Multiline"]            = '\M'
"
"""" Customize pmenu colors
"hi Pmenu ctermfg=white ctermbg=black guibg=DarkGrey
"
""***********************************
"" coc-ecdict
""***********************************
"comm! -nargs=? -bang WordDict  call CocActionAsync('doHover')
"
""***********************************
"" common
""***********************************
"
"comm! -nargs=? -bang Terminal call NewtabTerminal()
"comm! -nargs=? -bang T Terminal
""au TermClose * :q
"
""***********************************
"" coc-ecdict
""***********************************
"let nvimgdb_config_override = {}
"let nvimgdb_disable_start_keymaps = 1
"
"lua require("09map")
