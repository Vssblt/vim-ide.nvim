"         _                              __ _       

"  __   _(_)_ __ ___     ___ ___  _ __  / _(_) __ _ 
"  \ \ / / | '_ ` _ \   / __/ _ \| '_ \| |_| |/ _` |
"   \ V /| | | | | | | | (_| (_) | | | |  _| | (_| |
"    \_/ |_|_| |_| |_|  \___\___/|_| |_|_| |_|\__, |
"                                             |___/ 
"键盘上有很多反人类键，例如dvorak键位下的 'f'，'', 'l', '/', '='，这些按键要么在快速
"输入时需要大范围移动手指（f, ），要么频繁使用小指（l, /, =, 三个按键全是一个小指），
"映射时应尽量避免使这些按键

""""""""""""""""""""""""""""""
" normal
""""""""""""""""""""""""""""""
nnoremap o ox<BS>
nnoremap O Ox<BS>
nnoremap W b

nnoremap <silent> * :let @/= '\<' . expand('<cword>') . '\>' <bar> set hls <cr>
nnoremap <silent> g* :let @/=expand('<cword>') <bar> set hls <cr>

noremap <C-d> <C-\><C-n>

nnoremap yi<space> yiW
nnoremap bi<space> ciW
nnoremap di<space> diW
nnoremap vi<space> viW

nnoremap b" ci"
nnoremap b[ ci[
nnoremap b{ ci{
nnoremap b' ci'
nnoremap b` ci`
nnoremap b( ci(
nnoremap b<space> ciW
nnoremap b< ci<

nnoremap d" di"
nnoremap d[ di[
nnoremap d{ di{
nnoremap d' di'
nnoremap d` di`
nnoremap d( di(
nnoremap d<space> diW
nnoremap d< di<

nnoremap y" yi"
nnoremap y[ yi[
nnoremap y{ yi{
nnoremap y' yi'
nnoremap y` yi`
nnoremap y( yi(
nnoremap y<space> yiW
nnoremap y< yi<

nnoremap <C-n> 4j
nnoremap <C-t> 4k
nnoremap <c-h> 4h
nnoremap <c-s> 4l

xnoremap <c-h> 4h
xnoremap <c-s> 4l
xnoremap <c-n> 4j
xnoremap <c-t> 4k

nnoremap h h
nnoremap t k
nnoremap n j
nnoremap s l
xnoremap h h
xnoremap t k
xnoremap n j
xnoremap s l

nnoremap s l
xnoremap s l

inoremap <c-n> <esc>A

lua vim.keymap.set("n", "n", [[v:count ? 'j' : 'gj']], {noremap = true, expr = true, silent=true})
lua vim.keymap.set("x", "n", [[v:count ? 'j' : 'gj']], {noremap = true, expr = true, silent=true})

lua vim.keymap.set("n", "t", [[v:count ? 'k' : 'gk']], {noremap = true, expr = true, silent=true})
lua vim.keymap.set("x", "t", [[v:count ? 'k' : 'gk']], {noremap = true, expr = true, silent=true})

function! NetrwMapping()
  nnoremap <buffer> t k
  nnoremap <buffer> n j
  nnoremap <buffer> s l
  xnoremap <buffer> t k
  xnoremap <buffer> n j
  xnoremap <buffer> s l
endfunction

augroup netrw_mapping

  autocmd! 
  autocmd filetype netrw call NetrwMapping()

augroup end

nnoremap <C-w>t <C-\><C-n>:WinShift up<CR>
nnoremap <C-w>s <C-\><C-n>:WinShift right<CR>
nnoremap <C-w>n <C-\><C-n>:WinShift down<CR>
nnoremap <C-w>h <C-\><C-n>:WinShift left<CR>
xnoremap <C-w>t <C-\><C-n>:WinShift up<CR>
xnoremap <C-w>s <C-\><C-n>:WinShift right<CR>
xnoremap <C-w>n <C-\><C-n>:WinShift down<CR>
xnoremap <C-w>h <C-\><C-n>:WinShift left<CR>

nnoremap T <C-\><C-n>k
nnoremap S <C-\><C-n>l
nnoremap N <C-\><C-n>j
nnoremap H <C-\><C-n>h
imap <c-n> <c-j>
imap <c-t> <c-k>
smap <c-n> <c-j>
smap <c-t> <c-k>

nnoremap <silent> <leader>k :call InterestingWords('n')<cr>
xnoremap <silent> <leader>k :call InterestingWords('v')<cr>
nnoremap <silent> <leader>K :nohl<CR>:call UncolorAllWords()<cr>
nnoremap <silent> l :call WordNavigation(1)<cr>
nnoremap <silent> L :call WordNavigation(0)<cr>

nnoremap j 8<c-y>
nnoremap k 8<c-e>
xnoremap j 8<c-y>
xnoremap k 8<c-e>

function Scrolloff_eof()
  if (g:x < winheight("%"))
    return 
  endif
  let l:lines = winheight("%")
  let l:lines = l:lines / 5 * 2
  call feedkeys( l:lines . "\<c-e>")
endfunction

nnoremap <silent> G :let g:x = line("$") - line(".")<CR>G:call Scrolloff_eof()<CR>

nnoremap b c
nnoremap <silent> r :bnext<CR>
xnoremap b c
xnoremap <silent> r :bnext<CR>
nmap <silent> r :bn<CR>
nmap <silent> c :bp<CR>
nnoremap R gt
nnoremap C gT
"nmap <leader>b :set buflisted<CR>c:sp<CR>r:bd<cr>
"nmap <leader>B :bufdo bd<CR>
nmap <silent> <leader>b :Bdelete<CR>
nmap <silent> <leader>B :bufdo Bdelete<CR>

nnoremap <ScrollWheelUp> <C-Y><C-Y><C-Y><C-Y>
nnoremap <ScrollWheelDown> <C-E><C-E><C-E><C-E>
xnoremap <ScrollWheelUp> <C-Y><C-Y><C-Y><C-Y>
xnoremap <ScrollWheelDown> <C-E><C-E><C-E><C-E>
inoremap <ScrollWheelUp> <C-Y><C-Y><C-Y><C-Y>
inoremap <ScrollWheelDown> <C-E><C-E><C-E><C-E>

nnoremap <C-e> <C-i>

nnoremap <leader>- $
nnoremap <leader>d ^
xnoremap <leader>- $
xnoremap <leader>d ^
nnoremap d<leader>- d$
nnoremap d<leader>d d^

nnoremap <tab><tab> <Esc>/\(\(\[TODO\:\)\\|\(<+\)\).*\(\(\]\)\\|\(+>\)\)<CR>:nohlsearch<CR>"_cgn
nnoremap <tab><tab> <Esc>/<++><CR>:nohlsearch<CR>"_cgn

nnoremap <silent> <leader>; :SymbolsOutline<CR>
nnoremap <silent> <leader>q :NvimTreeToggle<CR>
nnoremap <silent> <leader>j :GundoToggle<CR>

nmap . <Plug>(choosewin)
nnoremap " ,
xnoremap " ,

function! CopyAppend()
	if g:with_x11 == 1
		let @*=@*.getline('.')."\n"
	else
		let @" .= getline('.')."\n"
	endif
endfunction

function! CutAppend()
	if g:with_x11 == 1
		let @*=@*.getline('.')."\n"
	else
		let @" .= getline('.')."\n"
	endif
	execute "delete _"
endfunction

nnoremap <silent> <leader>yy :call CopyAppend()<CR>
xnoremap <silent> <leader>yy :call CopyAppend()<CR>
nnoremap <silent> <leader>yd :call CutAppend()<CR>
xnoremap <silent> <leader>yd :call CutAppend()<CR>

nnoremap <leader>/ VHoL<Esc>``/\%V
nnoremap <leader>* VHoL<Esc>``/\%V<C-r><C-w><CR>
nnoremap # :b#<CR>

""""""""""""""""""""""""""""""
" toggleterm
""""""""""""""""""""""""""""""
nnoremap <silent> <leader><leader>t :ToggleTerm direction=float<CR>
nnoremap <silent> <leader><leader>s :TermSelect<CR>

inoremap <C-BS> <C-W>
inoremap  <C-W>
onoremap <C-BS> <C-W>
onoremap  <C-W>

""""""""""""""""""""""""""""""
" SymbolsOutline
""""""""""""""""""""""""""""""
" autocmd FileType Outline IndentBlanklineDisable

""""""""""""""""""""""""""""""
" ranger
""""""""""""""""""""""""""""""
autocmd TermOpen * call TermInit()
func TermInit()
  setlocal nonu
  setlocal norelativenumber
  startinsert
endfunc

autocmd BufEnter * call BufEnter()
func BufEnter()
  let l:bufname=bufname("%")
  let l:bufwinnr = bufwinnr(bufname)
  if (exists("g:TagList_title") && l:bufname == g:TagList_title)
    if (exists("g:TagList_showNum") && g:TagList_showNum == 1)
      setlocal nu
    else
      setlocal nonu
    endif
    if (exists("g:TagList_showRelativeNumber") && g:TagList_showRelativeNumber == 1)
      setlocal relativenumber
    else
      setlocal norelativenumber
    endif
  endif
endfunc

" fzf.vim
nmap <silent> <leader>a :Ranger<CR>
omap <silent> <leader>a :Ranger<CR>
xmap <silent> <leader>a :Ranger<CR>
nmap <silent> <leader>o :lua require('fzf-lua').files({ fzf_opts = {['--layout'] = 'reverse-list'}, winopts = { preview = { layout = 'flex', flip_columns = 200 } } })<CR>
omap <silent> <leader>o :lua require('fzf-lua').files({ fzf_opts = {['--layout'] = 'reverse-list'}, winopts = { preview = { layout = 'flex', flip_columns = 200 } } })<CR>
xmap <silent> <leader>o :lua require('fzf-lua').files({ fzf_opts = {['--layout'] = 'reverse-list'}, winopts = { preview = { layout = 'flex', flip_columns = 200 } } })<CR>
nmap <silent> <leader>u :lua require('fzf-lua').lines({ fzf_opts = {['--layout'] = 'reverse-list'}, winopts = { preview = { layout = 'flex', flip_columns = 200 } } })<CR>
omap <silent> <leader>u :lua require('fzf-lua').lines({ fzf_opts = {['--layout'] = 'reverse-list'}, winopts = { preview = { layout = 'flex', flip_columns = 200 } } })<CR>
xmap <silent> <leader>u :lua require('fzf-lua').lines({ fzf_opts = {['--layout'] = 'reverse-list'}, winopts = { preview = { layout = 'flex', flip_columns = 200 } } })<CR>
nnoremap <silent> B :lua require('fzf-lua').buffers({winopts = { preview = { layout = 'flex', flip_columns = 200 } } })<CR>
nnoremap <silent> M :lua require('fzf-lua').marks({winopts = { preview = { layout = 'flex', flip_columns = 200 } } })<CR>
autocmd FileType fzf tnoremap <buffer> <C-n> <Down>
autocmd FileType fzf tnoremap <buffer> <C-t> <Up>
" autocmd FileType fzf IndentBlanklineDisable
autocmd FileType fzf setl signcolumn=no

nmap <silent> <leader>e :lua require('fzf-lua').git_files({winopts = { preview = { layout = 'flex', flip_columns = 200 } } })<CR>
omap <silent> <leader>e :lua require('fzf-lua').git_files({winopts = { preview = { layout = 'flex', flip_columns = 200 } } })<CR>
xmap <silent> <leader>e :lua require('fzf-lua').git_files({winopts = { preview = { layout = 'flex', flip_columns = 200 } } })<CR>

""""""""""""""""""""""""""""""
" nvim-cmp and nvim-lspconfig
""""""""""""""""""""""""""""""
imap <silent><expr> <C-n> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
inoremap <silent> <C-t> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <C-n> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <C-t> <cmd>lua require('luasnip').jump(-1)<Cr>

comm! -nargs=? -bang A ClangdSwitchSourceHeader

""""""""""""""""""""""""""""""
" vim-surround
""""""""""""""""""""""""""""""
" nmap ds  <Plug>Dsurround
" nmap bs  <Plug>Csurround
" nmap bS  <Plug>CSurround
" nmap ys  <Plug>Ysurround
" nmap yS  <Plug>YSurround
" nmap yss <Plug>Yssurround
" nmap ySs <Plug>YSsurround
" nmap ySS <Plug>YSsurround
" xmap S   <Plug>VSurround
" xmap gS  <Plug>VgSurround
"

""""""""""""""""""""""""""""""
" vim-visual-multi
""""""""""""""""""""""""""""""
nmap <leader><c-a> <c-l><c-a>
let g:VM_default_mappings = 0
let g:VM_leader = ','
let g:VM_maps = {}
let g:VM_custom_remaps = {'s' : 'l', ',d' : 'k', ',-' : 'j', '<c-a>' : '<leader>A', 'b':'c'}

let g:VM_maps['Find Under']                  = '<c-l>'
let g:VM_maps['Find Subword Under']          = '<c-l>'
let g:VM_maps["Select All"]                  = '<leader>A' 
let g:VM_maps["Start Regex Search"]          = '\/'
let g:VM_maps["Add Cursor Down"]             = '<C-Down>'
let g:VM_maps["Add Cursor Up"]               = '<C-Up>'
let g:VM_maps["Add Cursor At Pos"]           = '\\'

let g:VM_maps["Visual Regex"]                = '\/'
let g:VM_maps["Visual All"]                  = '\A' 
let g:VM_maps["Visual Add"]                  = '\a'
let g:VM_maps["Visual Find"]                 = '\f'
let g:VM_maps["Visual Cursors"]              = '\c'
let g:VM_maps["Select Cursor Down"]          = '<M-C-Down>'
let g:VM_maps["Select Cursor Up"]            = '<M-C-Up>'
let g:VM_maps["Select Operator"]            = ''

let g:VM_maps["Erase Regions"]               = '\gr'

let g:VM_maps["Mouse Cursor"]                = '<C-LeftMouse>'
let g:VM_maps["Mouse Word"]                  = '<C-RightMouse>'
let g:VM_maps["Mouse Column"]                = '<M-C-RightMouse>'
let g:VM_maps["Switch Mode"]                 = '<Tab>'

let g:VM_maps["Find Next"]                   = ']'
let g:VM_maps["Find Prev"]                   = '['
let g:VM_maps["Goto Next"]                   = '}'

let g:VM_maps["Goto Prev"]                   = '{'
let g:VM_maps["Seek Next"]                   = '<C-f>'
let g:VM_maps["Seek Prev"]                   = '<C-b>'
let g:VM_maps["Skip Region"]                 = 'q'
let g:VM_maps["Remove Region"]               = 'Q'
let g:VM_maps["Invert Direction"]            = 'o'
let g:VM_maps["Find Operator"]               = "m"
let g:VM_maps["Surround"]                    = 'S'
let g:VM_maps["Replace Pattern"]             = 'R'

let g:VM_maps["Tools Menu"]                  = '\`'
let g:VM_maps["Show Registers"]              = '\"'
let g:VM_maps["Case Setting"]                = '\c'
let g:VM_maps["Toggle Whole Word"]           = '\w'
"let g:VM_maps["Transpose"]                   = '\t'
let g:VM_maps["Align"]                       = '\a'
let g:VM_maps["Duplicate"]                   = '\d'
let g:VM_maps["Rewrite Last Search"]         = '\r'
let g:VM_maps["Merge Regions"]               = '\m'
let g:VM_maps["Split Regions"]               = '\s'
let g:VM_maps["Remove Last Region"]          = '\q'
let g:VM_maps["Visual Subtract"]             = '\s'
let g:VM_maps["Case Conversion Menu"]        = '\C'
let g:VM_maps["Search Menu"]                 = '\S'

let g:VM_maps["Run Normal"]                  = '\z'
let g:VM_maps["Run Last Normal"]             = '\Z'
let g:VM_maps["Run Visual"]                  = '\v'
let g:VM_maps["Run Last Visual"]             = '\V'
let g:VM_maps["Run Ex"]                      = '\'
let g:VM_maps["Run Last Ex"]                 = '\'
let g:VM_maps["Run Macro"]                   = '\@'
let g:VM_maps["Align Char"]                  = '\<'
let g:VM_maps["Align Regex"]                 = '\>'
let g:VM_maps["Numbers"]                     = '\n'
let g:VM_maps["Numbers Append"]              = '\N'
let g:VM_maps["Zero Numbers"]                = '\0n'
let g:VM_maps["Zero Numbers Append"]         = '\0N'
let g:VM_maps["Shrink"]                      = "\-"
let g:VM_maps["Enlarge"]                     = "\+"

let g:VM_maps["Toggle Block"]                = '\<BS>'
let g:VM_maps["Toggle Single Region"]        = '\<CR>'
let g:VM_maps["Toggle Multiline"]            = '\M'

""""""""""""""""""""""""""""""
" picker
""""""""""""""""""""""""""""""

nmap <leader>.e <Plug>(PickerEdit)
nmap <leader>.s <Plug>(PickerSplit)
nmap <leader>.t <Plug>(PickerTabedit)
nmap <leader>.d <Plug>(PickerTabdrop)
nmap <leader>.v <Plug>(PickerVsplit)
nmap <leader>.b <Plug>(PickerBuffer)
nmap <leader>.] <Plug>(PickerTag)
nmap <leader>.w <Plug>(PickerStag)
nmap <leader>.o <Plug>(PickerBufferTag)
nmap <leader>.h <Plug>(PickerHelp)

""""""""""""""""""""""""""""""
" make 
""""""""""""""""""""""""""""""
let g:makefile_path = "."
nnoremap <silent> <F4> :exec "Make -C " . g:makefile_path . " -j `nproc`"<CR>
nnoremap <silent> <C-c> :AbortDispatch<CR>
function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
        exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  if (a:pfx == "c")
    exec('Copen')
  else
    exec(a:pfx.'open')
  endif
  if winnr() != winnr
    wincmd p
  endif
endfunction

nmap <silent> <F2> :call ToggleList("Quickfix", 'c')<CR>

function! g:Start_Termdebug(arg)
	if v:shell_error == 0
		execute "Termdebug " . a:arg
	endif
endfunction
nnoremap <silent> <F6> :!Make -j `nproc`<CR>:call g:Start_Termdebug("")<CR>


"***********************************
" debugger
"***********************************
noremap <silent> <F5> :lua require'nvim-gdb'.open_layout()<CR><ESC>

comm! -nargs=? -bang L e ~/.local/share/nvim/site/pack/packer/start/light-gdb.nvim/lua/gdb/

augroup autoHideBuf
  autocmd!
  autocmd BufReadPost,BufFilePost * call HideBuf(["[dap-repl]"], ["quickfix"]) 
augroup END

function HideBuf(name_list, type_list)
  call HideBufByName(a:name_list)
  call HideBufByType(a:type_list)
endfunc

function HideBufByName(list)
  for l:buf_name in a:list
    if (l:buf_name == bufname("%"))
      exec 'setlocal nobuflisted'
    endif
  endfor
endfunction

function HideBufByType(list)
  for l:buf_type in a:list
    if (l:buf_type == &buftype)
      exec 'setlocal nobuflisted'
    endif
  endfor
endfunction

autocmd BufRead,BufNewFile quickfix setlocal nomodifiable

augroup QuickFixWinVar
  autocmd!
  autocmd FileType qf map <silent><buffer> r r
  autocmd FileType qf map <silent><buffer> c c
  autocmd FileType qf map <silent><buffer> q :q<CR>
augroup END

augroup HelpWinVar
  autocmd!
  autocmd FileType help map <silent><buffer> r r
  autocmd FileType help map <silent><buffer> c c
augroup END

augroup AerialWinVar
  autocmd!
  autocmd FileType aerial map <silent><buffer> r r
  autocmd FileType aerial map <silent><buffer> c c
augroup END

augroup LtWinVar
  autocmd!
  autocmd FileType ltlist map <silent><buffer> r r
  autocmd FileType ltlist map <silent><buffer> c c
  autocmd FileType ltdesc map <silent><buffer> r r
  autocmd FileType ltdesc map <silent><buffer> c c
augroup END

"***********************************
" common
"***********************************
function NewtabTerminal()
  tabnew
  execute("terminal")
endfunction
comm! -nargs=? -bang Terminal call NewtabTerminal()
comm! -nargs=? -bang T Terminal

"***********************************
" vgit.nvim
"***********************************
comm! -nargs=? -bang Gitcheckout lua require('vgit').checkout(<f-args>)

comm! -nargs=? -bang Gitdiff lua require('vgit').buffer_diff_preview()
comm! -nargs=? -bang Gitstatus lua require('vgit').project_diff_preview()

comm! -nargs=? -bang Gitblameline lua require('vgit').buffer_blame_preview()
comm! -nargs=? -bang Gitblamebuf lua require('vgit').buffer_gutter_blame_preview()

comm! -nargs=? -bang Gitdiffhunk lua require('vgit').buffer_hunk_preview()
comm! -nargs=? -bang Gitlog lua require('vgit').project_logs_preview()
comm! -nargs=? -bang Gitlogall lua require('vgit').project_logs_preview('--all')

map <space><esc> <Nop>
map <leader>c<esc> <Nop>
map <leader>r<esc> <Nop>
map <leader><esc> <Nop>

lua require("user/map")
