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
" choosewin settings
""""""""""""""""""""""""""""""
let g:choosewin_overlay_enable = 0
let g:choosewin_label = "aoeuidhtns"

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
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

let g:termdebug_wide = 160
let g:termdebug_disasm_window = 0
let g:termdebug_new_tab = 1

""""""""""""""""""""""""""""""
" vim-doge
""""""""""""""""""""""""""""""
"let g:doge_enable_mappings=0
let g:doge_mapping='gc'
let g:doge_mapping_comment_jump_forward='<c-n>'
let g:doge_mapping_comment_jump_backward='<c-t>'
let g:doge_doc_standard_cpp='doxygen_javadoc'

""""""""""""""""""""""""""""""
" leetcode.vim
""""""""""""""""""""""""""""""
let g:leetcode_browser = "firefox"
