"You can change important config here. If you want to edit other config you
"can use :HConfig to open and change it.

""""""""""""""""""""""""""""""
" common settings
""""""""""""""""""""""""""""""
let mapleader=',' 
let g:VM_leader='.'
let g:plugindir = expand('<sfile>:p:h:h')
let g:tagsPath = g:plugindir."/tags"
let g:vvimrc_name=".vvimrc"
let g:with_x11 = 0
set tabstop=2
set sw=2

""""""""""""""""""""""""""""""
" EasyMotion settings
""""""""""""""""""""""""""""""
let g:EasyMotion_keys = "aoeuidhtns',.pyfgcrl;qjkxbmwvz" "This is used for dvorak keyboard layout, you can change this option if you'r using qwerty layout.
let g:EasyMotion_smartcase = 1

""""""""""""""""""""""""""""""
" choosewin settings
""""""""""""""""""""""""""""""
let g:choosewin_overlay_enable = 0
let g:choosewin_label = "aoeuidhtns"

""""""""""""""""""""""""""""""
" vim-floaterm settings
""""""""""""""""""""""""""""""
let g:floaterm_height = 0.9
let g:floaterm_width = 0.9
let g:floaterm_autoclose = 2

""""""""""""""""""""""""""""""
" vim-floaterm settings
""""""""""""""""""""""""""""""
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

""""""""""""""""""""""""""""""
" coc plugin settings
" 依赖 clangd
""""""""""""""""""""""""""""""

" Support languages: java javascript cpp/c html css vim markdown python cmake qmake go php
" Other: highlight, yank, explorer, snippets
" Don't supported: c#
    "\ 'coc-yank',
let g:coc_global_extensions = [
    \ 'coc-clangd',
    \ 'coc-cmake',
    \ 'coc-vimlsp',
    \ 'coc-html',
    \ 'coc-ecdict',
    \ 'coc-pyright',
    \ 'coc-css',
    \ 'coc-java',
    \ 'coc-phpls',
    \ 'coc-go',
    \ 'coc-snippets',
    \ 'coc-marketplace',
    \ 'coc-sh',
    \ 'coc-word',
    \ 'coc-yaml',
    \ 'coc-xml',
    \ 'coc-webpack',
    \ 'coc-sql',
    \ 'coc-docker',
    \ 'coc-json',
    \ 'coc-clang-format-style-options',
    \ 'coc-lua',
    \ 'coc-tsserver',
    \ 'coc-vetur',
    \ 'coc-highlight',
  \ ]

""""""""""""""""""""""""""""""
" other settings
""""""""""""""""""""""""""""""
let g:sonokai_style = 'shusia'
let g:sonokai_better_performance = 1
execute ":colorscheme sonokai"

highlight LineNr term=bold cterm=NONE ctermfg=darkgray ctermbg=NONE gui=NONE guifg=darkgray guibg=NONE
highlight FloatermBorder ctermfg=green cterm=bold

""""""""""""""""""""""""""""""
" vim-glaive settings
""""""""""""""""""""""""""""""
call glaive#Install()
Glaive codefmt clang_format_executable='clang-format'
Glaive codefmt google_java_executable="java -jar /opt/google-java-format/google-java-format-1.15.0-all-deps.jar"

""""""""""""""""""""""""""""""
" vim-codefmt settings
""""""""""""""""""""""""""""""
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

let g:termdebug_wide = 160
let g:termdebug_disasm_window = 0
let g:termdebug_new_tab = 1

""""""""""""""""""""""""""""""
" Yggdroot/indentLine
""""""""""""""""""""""""""""""
"let g:rainbow_colors_black = [236, 235] 
"call rainbow#enable()
let g:indentLine_char = '┊'


""""""""""""""""""""""""""""""
" vim-doge
""""""""""""""""""""""""""""""
"let g:doge_enable_mappings=0
let g:doge_mapping='gc'
let g:doge_mapping_comment_jump_forward='<c-n>'
let g:doge_mapping_comment_jump_backward='<c-t>'
let g:doge_doc_standard_cpp='doxygen_javadoc'

""""""""""""""""""""""""""""""
" dap
""""""""""""""""""""""""""""""
let g:dap_cpp_adapter='cppdbg'
"let g:dap_cpp_adapter='lldb'


""""""""""""""""""""""""""""""
" leetcode.vim
""""""""""""""""""""""""""""""
let g:leetcode_browser = "firefox"
