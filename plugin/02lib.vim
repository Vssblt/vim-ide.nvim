""""""""""""""""""""""""""""""
"This file is hiden config file. 
""""""""""""""""""""""""""""""

lua require("ide-lib")

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
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta ctermfg=lightblue guifg=#505080 guibg=#C06060

""""""""""""""""""""""""""""""
" ranger settings
""""""""""""""""""""""""""""""
let g:ranger_map_keys = 0

""""""""""""""""""""""""""""""
" orther
""""""""""""""""""""""""""""""
if filereadable(g:plugindir."/plugin/04tempConfig.vim")
    execute ':source' g:plugindir."/plugin/04tempConfig.vim"
endif

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

highlight EndOfBufferInactive ctermfg=bg guifg=#2d2a2e guibg=#2d2a2e
highlight EndOfBufferActive ctermfg=bg guifg=#252226 guibg=#252226

set winhighlight+=EndOfBuffer:EndOfBufferInactive

augroup NrHighlight
  autocmd!
  
  autocmd VimEnter,WinEnter,BufWinEnter * :exe "setlocal winhighlight=".substitute(&winhighlight, "EndOfBufferInactive", "EndOfBufferActive", "")
  autocmd WinLeave * :exe "setlocal winhighlight=".substitute(&winhighlight, "EndOfBufferActive", "EndOfBufferInactive", "")
  
  autocmd VimEnter,WinEnter,BufWinEnter * :highlight Normal ctermfg=250 ctermbg=235 guifg=#d3d1d4 guibg=#242125
  autocmd WinLeave * :highlight Normal ctermfg=250 ctermbg=235 guifg=#d3d1d4 guibg=#272428
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

