local Lib = {}
function Lib.setup()

  vim.cmd[[
  
    " function s:tempWin()
    "   if 
    " endfunction
  
    
    " augroup DISABLE_SIGNCOLUMN
	   "  autocmd!
    " autocmd BufWinEnter * if (s:tempWin())  endif
	   "  " au FileType NvimTree,Outline,ltgdb-terminal,ltgdb-terminal,ltgdb-stack,ltgdb-breakpoint,ltgdb-scope,ltgdb-watch setlocal signcolumn=no
    " " augroup END
    " 
    " augroup DISABLE_FOLDCOLUMN
	   "  autocmd!
	   "  au FileType NvimTree,Outline,ltgdb-terminal,ltgdb-terminal,ltgdb-stack,ltgdb-breakpoint,ltgdb-scope,ltgdb-watch setlocal foldcolumn=0
    " augroup END


    """"""""""""""""""""""""""""""
    " common settings
    """"""""""""""""""""""""""""""
    let mapleader=',' 
    let g:VM_leader='.'
    let g:vvimrc_name=".vvimrc"
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
    " leetcode.vim
    """"""""""""""""""""""""""""""
    let g:leetcode_browser = "firefox"
  ]]

  ---------------------------
  -- Common
  ---------------------------
  vim.o.lazyredraw = false
  vim.o.wildmenu = true
  vim.o.laststatus = 3
  vim.o.showtabline = 2
  vim.o.number = true
  vim.o.relativenumber = true
  vim.o.encoding = "utf8"
  vim.o.fileencodings= "ucs-bom,utf8,cp936,gb18030,big5,euc-jp,euc-kr,latin1"
  vim.o.hlsearch = true
  vim.o.showmatch = true
  vim.o.ignorecase =true
  vim.o.viminfo = "'20,\"50000"
  vim.o.timeoutlen = 10000
  vim.o.ttimeoutlen = 10
  vim.o.clipboard = "unnamedplus,unnamed"
  vim.o.mouse = "a"
  vim.o.t_Co = 256
  vim.o.fillchars = "stl: "
  vim.o.backspace = "indent,eol,start"
  vim.o.numberwidth = 1
  vim.o.scrolloff = 8
  vim.o.tabstop = 2
  vim.o.shiftwidth = 2
  vim.o.expandtab = true
  vim.o.smarttab = true
  vim.o.smartcase = true
  vim.o.softtabstop = 0
  vim.o.hidden = true
  vim.o.synmaxcol = 320
  vim.o.updatetime = 100
  vim.o.autoread = true
  vim.o.signcolumn = "number"
  vim.o.undofile = true
  vim.o.completeopt = "menu,menuone,noselect,noinsert"
  vim.o.termguicolors = true
  vim.o.pumheight = 40
  vim.o.pumwidth = 40
  vim.o.foldcolumn = '0' -- '0' is not bad
  vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
  vim.o.foldlevelstart = 99
  vim.o.foldenable = true
  vim.o.splitkeep = "screen"
  vim.o.efm = "%\\S%#/ld: %f:%l:%m,%*[^\"]\"%f\"%*\\D%l: %m,\"%f\"%*\\D%l: %m,%-G%f:%l: (Each undeclared identifier is reported only once,%-G%f:%l: for each function it appears in.),%-GIn file included from %f:%l:%c:,%-GIn file included from %f:%l:%c\\,,%-GIn file included from %f:%l:%c,%-GIn file included from %f:%l,%-G%*[ ]from %f:%l:%c,%-G%*[ ]from %f:%l:,%-G%*[ ]from %f:%l\\,,%-G%*[ ]from %f:%l,%f:%l:%c:%m,%f(%l):%m,%f:%l:%m,\"%f\"\\, line %l%*\\D%c%*[^ ] %m,%D%*\\a[%*\\d]: Entering directory %*[`']%f',%X%*\\a[%*\\d]: Leaving directory %*[`']%f',%D%*\\a: Entering directory %*[`']%f',%X%*\\a: Leaving directory %*[`']%f',%DMaking %*\\a in %f,%f|%l| %m"

  -- vim.o.efm = "" .. vim.o.efm
  -- vim.opt.foldmethod = "expr"
  -- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
  vim.cmd[[colorscheme sonokai]]
  vim.cmd("syntax off")

  vim.cmd[[hi FocusedSymbol guifg=#1f1f1f guibg=#78dce8]]

  vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    pattern = {"*"},
    callback = function()
      vim.highlight.on_yank(
        {
          timeout = 500,
        }
      )
    end
  })
  vim.api.nvim_create_autocmd({"BufWinEnter"},
    {
      pattern = {"*"},
      callback = function(ev)
        if vim.bo.filetype == "Outline"
          or vim.bo.filetype == "ltgdb-terminal"
          or vim.bo.filetype == "ltgdb-terminal"
          or vim.bo.filetype == "ltgdb-stack"
          or vim.bo.filetype == "ltgdb-breakpoint"
          or vim.bo.filetype == "ltgdb-scope"
          or vim.bo.filetype == "ltgdb-watch"
          or vim.bo.filetype == 'fzf'
        then
          vim.wo.signcolumn="no"
          vim.wo.foldcolumn='0'
        end
      end,
    }
  )

  vim.api.nvim_create_user_command("FHide", "FloatermHide", { bang = true })
  vim.api.nvim_create_user_command("FNext", "FloatermNext", { bang = true })
  vim.api.nvim_create_user_command("FFirst", "FloatermFirst", { bang = true })
  vim.api.nvim_create_user_command("FKill", "FloatermKill", { bang = true })
  vim.api.nvim_create_user_command("FLast", "FloatermLast", { bang = true })
  vim.api.nvim_create_user_command("FPrev", "FloatermPrev", { bang = true })
  vim.api.nvim_create_user_command("FShow", "FloatermShow", { bang = true })

  vim.api.nvim_create_user_command("Vmap", "e $HOME/.config/nvim/lua/user/map.lua", { bang = true })
  vim.api.nvim_create_user_command("Vlib", "e $HOME/.config/nvim/lua/user/lib.lua", { bang = true })
  vim.api.nvim_create_user_command("Vinit", "e $HOME/.config/nvim/init.lua", { bang = true })

  vim.api.nvim_create_user_command("VMap", "e $HOME/.config/nvim/lua/user/map.lua", { bang = true })
  vim.api.nvim_create_user_command("VLib", "e $HOME/.config/nvim/lua/user/lib.lua", { bang = true })
  vim.api.nvim_create_user_command("VInit", "e $HOME/.config/nvim/init.lua", { bang = true })

  vim.api.nvim_create_user_command("Bda", "bufdo bwipeout", { bang = true })

  local CursorLineOnlyInActiveWindow = vim.api.nvim_create_augroup("CursorLineOnlyInActiveWindow" , {clear = true})
  vim.api.nvim_create_autocmd({"WinEnter", "VimEnter", "BufWinEnter" }, { command = "setlocal cursorline", group = CursorLineOnlyInActiveWindow })
  vim.api.nvim_create_autocmd({"WinLeave" }, { command = "setlocal nocursorline", group = CursorLineOnlyInActiveWindow })

  vim.api.nvim_create_autocmd({"FileType"}, { pattern = "qf", command = "wincmd J" })
  vim.api.nvim_create_autocmd({"FileType"}, { pattern = "fzf", command = "setlocal signcolumn=no" })

  ---------------------------
  -- mzlogin/vim-markdown-toc
  ---------------------------
  vim.api.nvim_create_autocmd({"FileType"}, { pattern = "markdown", command = "command! TOC :GenTocGFM" })

  ---------------------------
  -- vim-dispatch
  ---------------------------
  vim.g.dispatch_quickfix_height = 20
  vim.g.dispatch_tmux_height = 20

  ---------------------------
  -- LookupFile
  ---------------------------
  vim.g.LookupFile_MinPatLength = 2
  vim.g.LookupFile_PreservePatternHistory = 1
  vim.g.LookupFile_AlwaysAcceptFirst = 1
  vim.g.LookupFile_PreserveLastPattern = 0

  ---------------------------
  -- vim-glaive settings
  ---------------------------
  vim.g.myplugin_enablefeature = 1
  vim.g.myplugin_defaultdir = os.getenv("HOME")
  vim.g.myplugin_weirdmode = 'm'

  ---------------------------
  -- clock settings
  ---------------------------
  vim.g.clockn_enable = 1
  vim.g.clockn_color = '#000000'
  vim.g.clockn_winblend = 100
  vim.api.nvim_set_hl(0, "ClockNormal", { fg = "#000000" })
  vim.g.clockn_to_top = 1
  vim.g.clockn_to_right = 1

  ---------------------------
  -- markdown-preview.nvim
  ---------------------------
  vim.g.mkdp_auto_start = 1
  vim.g.mkdp_auto_close = 1
  vim.g.mkdp_refresh_slow = 0
  vim.g.mkdp_command_for_global = 0
  vim.g.mkdp_open_to_the_world = 0
  vim.g.mkdp_open_ip = ''
  vim.g.mkdp_browser = ''
  vim.g.mkdp_echo_preview_url = 0
  vim.g.mkdp_browserfunc = ''
  vim.g.mkdp_preview_options = {
   mkit = {},
   katex = {},
   uml = {},
   maid = {},
   disable_sync_scroll = 0,
   sync_scroll_type = 'middle',
   hide_yaml_meta = 1,
   sequence_diagrams = {},
   flowchart_diagrams = {},
   content_editable = false,
   disable_filename = 0,
   toc = {}
   }
  vim.g.mkdp_markdown_css = ''
  vim.g.mkdp_highlight_css = ''
  vim.g.mkdp_port = ''
  vim.g.mkdp_page_title = '「${name}」'
  vim.g.mkdp_theme = 'dark'
  vim.g.vim_markdown_folding_disabled = 1

  ---------------------------
  -- vim-template
  -- Requires: sudo apt install ruby-licensee
  ---------------------------
  vim.g.email = "sunruiyangcp01@gmail.com"
  vim.g.username = "Vincent Sun"
  vim.g.templates_detect_git = 1


  ---------------------------
  -- vim-interestingwords settings
  ---------------------------
  vim.g.interestingWordsDefaultMappings = 0
  vim.g.interestingWordsRandomiseColors = 1
  vim.g.interestingWordsTermColors = {'154', '121', '211', '137', '214', '222', '1', '2', '3', '4', '6', '64', '99' }
  vim.g.interestingWordsGUIColors = {'#ef9062', '#e5c463', '#9ECD6F', '#ab9df2', '#E3E1E4', '#848089' }

  -- '#f85e84'
  ---------------------------
  -- notify
  ---------------------------
  vim.notify = require("notify")

  ---------------------------
  -- nvim-treesitter
  -- poor performance
  ---------------------------
  require'nvim-treesitter.configs'.setup {
    -- ensure_installed = "all",
    sync_install = false,
    highlight = {
      enable = true,
      -- disable = function (lang, bufnr)
      --   local buf_name = vim.api.nvim_buf_get_name(bufnr)
      --   local file_size = vim.api.nvim_call_function("getfsize", { buf_name })
      --   local check_file_size = vim.api.nvim_buf_line_count(bufnr) > 10000 or file_size > 200 * 1024
      --   local max_col = 0
      --   local col_limit = 360
      --   if check_file_size then
      --     return check_file_size
      --   end
      --   for _, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
      --     local col = #line
      --     if col > max_col then
      --       max_col = col
      --       if max_col > col_limit then
      --         return true
      --       end
      --     end
      --   end
      --   return false
      -- end,
      additional_vim_regex_highlighting = false,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ic"] = "@class.inner",
          ["ac"] = "@class.outer",
          ["is"] = "@scope.inner",
          ["as"] = "@scope.outer",
          ["ip"] = "@parameter.inner",
          ["ap"] = "@parameter.outer",
          ["id"] = "@conditional.inner",
          ["ad"] = "@conditional.outer",
          ["ib"] = "@block.inner",
          ["ab"] = "@block.outer",
          ["am"] = "@comment.outer",
          ["im"] = "@comment.inner",
        },
        selection_modes = {
          ['@parameter.outer'] = 'v',
          ['@function.outer'] = 'V',
          ['@class.outer'] = '<c-v>',
        },
        include_surrounding_whitespace = true,
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = { query = "@class.outer", desc = "Next class start" },
          --
          -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
          ["]o"] = "@loop.*",
          -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
          --
          -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
          -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
          ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
          ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
        -- Below will go to either the start or the end, whichever is closer.
        -- Use if you want more granular movements
        -- Make it even more gradual by adding multiple queries and regex.
        goto_next = {
          ["]d"] = "@conditional.outer",
        },
        goto_previous = {
          ["[d"] = "@conditional.outer",
        }
      },
    },
  }
  ---------------------------
  -- nvim-tree
  ---------------------------
  local function change_root_cwd()
    vim.cmd(":tcd " .. require'nvim-tree.api'.tree.get_nodes().absolute_path)
  end

  vim.api.nvim_create_autocmd({"BufWinLeave", "WinLeave", "TabLeave", }, { pattern = {"NvimTree_*"}, callback = change_root_cwd})

  local function nvim_tree_attach(bufnr)
    local api = require('nvim-tree.api')
    local function opts(desc)
      return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    vim.keymap.set("n", "<CR>",  api.node.open.edit,opts('Open'))
    vim.keymap.set("n", "o", api.node.open.edit,opts('Open'))
    vim.keymap.set("n", "<C-e>", api.node.open.replace_tree_buffer, opts('Open: In Place'))
    vim.keymap.set("n", "O", api.node.open.no_window_picker, opts('Open: No Window Picker'))
    vim.keymap.set("n", "<2-LeftMouse>",api.tree.change_root_to_node,opts('CD'))
    vim.keymap.set("n", "cd",api.tree.change_root_to_node,opts('CD'))
    vim.keymap.set("n", "<C-v>", '', {buffer = bufnr})
    vim.keymap.del("n", "<C-v>", {buffer = bufnr})
    vim.keymap.set("n", "<C-t>", '', {buffer = bufnr})
    vim.keymap.del("n", "<C-t>", {buffer = bufnr})
    vim.keymap.set("n", "<C-x>",api.node.open.horizontal,              opts('Open: Horizontal Split'))
    vim.keymap.set("n", ",t",api.node.open.tab,                     opts('Open: New Tab'))
    vim.keymap.set("n", "<",api.node.navigate.sibling.prev,        opts('Previous Sibling'))
    vim.keymap.set("n", ">",api.node.navigate.sibling.next,        opts('Next Sibling'))
    vim.keymap.set("n", "P",api.tree.change_root_to_parent,        opts('Up'))
    vim.keymap.set("n", "<BS>", api.node.navigate.parent_close,        opts('Close Directory'))
    vim.keymap.set("n", "<Tab>",api.node.open.preview,                 opts('Open Preview'))
    vim.keymap.set("n", "K",api.node.navigate.sibling.first,       opts('First Sibling'))
    vim.keymap.set("n", "J",api.node.navigate.sibling.last,        opts('Last Sibling'))
    vim.keymap.set("n", "I",api.tree.toggle_gitignore_filter,      opts('Toggle Git Ignore'))
    vim.keymap.set("n", "h",api.tree.toggle_hidden_filter,         opts('Toggle Dotfiles'))
    vim.keymap.set("n", "H","", {buffer = bufnr})
    vim.keymap.del("n", "H", {buffer = bufnr})
    vim.keymap.set("n", "U",api.tree.toggle_custom_filter,         opts('Toggle Hidden'))
    vim.keymap.set("n", "R",api.tree.reload,                       opts('Refresh'))
    vim.keymap.set("n", "a", api.fs.create,                         opts('Create'))
    vim.keymap.set("n", "dd", api.fs.remove,                         opts('Delete'))
    vim.keymap.set("n", "DD", api.fs.trash,                          opts('Trash'))
    vim.keymap.set("n", "r",api.fs.rename,                         opts('Rename'))
    vim.keymap.set("n", "<C-r>",api.fs.rename_sub,                     opts('Rename: Omit Filename'))
    vim.keymap.set("n", "x",api.fs.cut,                            opts('Cut'))
    vim.keymap.set("n", "yy", api.fs.copy.node,                      opts('Copy'))
    vim.keymap.set("n", "p", api.fs.paste,                          opts('Paste'))
    vim.keymap.set("n", "yn", api.fs.copy.filename,                  opts('Copy Name'))
    vim.keymap.set("n", "yp", api.fs.copy.relative_path,             opts('Copy Relative Path'))
    vim.keymap.set("n", "gy", api.fs.copy.absolute_path,             opts('Copy Absolute Path'))
    vim.keymap.set("n", "[c", api.node.navigate.git.prev,            opts('Prev Git'))
    vim.keymap.set("n", "]c",  api.node.navigate.git.next,            opts('Next Git'))
    vim.keymap.set("n", "-",api.node.navigate.parent,              opts('Parent Directory'))
    vim.keymap.set("n", "s",api.tree.search_node,                  opts('Search'))
    vim.keymap.set("n", "S","", {buffer = bufnr})
    vim.keymap.del("n", "S", {buffer = bufnr})
    vim.keymap.set("n", "f",api.live_filter.start,                 opts('Filter'))
    vim.keymap.set("n", "F",api.live_filter.clear,                 opts('Clean Filter'))
    vim.keymap.set("n", "q",api.tree.close,                        opts('Close'))
    vim.keymap.set("n", "W",api.tree.collapse_all,                 opts('Collapse'))
    vim.keymap.set("n", "E",api.tree.expand_all,                   opts('Expand All'))
    vim.keymap.set("n", ".","", {buffer = bufnr})
    vim.keymap.del("n", ".", {buffer = bufnr})
    vim.keymap.set("n", "<C-k>",api.node.show_info_popup,              opts('Info'))
    vim.keymap.set("n", "g?",  api.tree.toggle_help,                  opts('Help'))
  end
  require("nvim-tree").setup({
    --git = {
      --enable = false,
    --},
    sort_by = "case_sensitive",
    --disable_netrw = true,
    on_attach = nvim_tree_attach,
    hijack_netrw = true,
    view = {
      adaptive_size = false,
      width = 26
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
  })
  require('nvim-tree.view').View.winopts.signcolumn = 'no'
  require('nvim-tree.view').View.winopts.foldcolumn = "0"

  local function tab_win_closed(winnr)
    local api = require"nvim-tree.api"
    local tabnr = vim.api.nvim_win_get_tabpage(winnr)
    local bufnr = vim.api.nvim_win_get_buf(winnr)
    local buf_info = vim.fn.getbufinfo(bufnr)[1]
    local tab_wins = vim.tbl_filter(function(w) return w~=winnr end, vim.api.nvim_tabpage_list_wins(tabnr))
    local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
    if buf_info.name:match(".*NvimTree_%d*$") then            -- close buffer was nvim tree
      -- Close all nvim tree on :q
      if not vim.tbl_isempty(tab_bufs) then                      -- and was not the last window (not closed automatically by code below)
        api.tree.close()
      end
    else                                                      -- else closed buffer was normal buffer
      if #tab_bufs == 1 then                                    -- if there is only 1 buffer left in the tab
        local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
        if last_buf_info.name:match(".*NvimTree_%d*$") then       -- and that buffer is nvim tree
          vim.schedule(function ()
            if #vim.api.nvim_list_wins() == 1 then                -- if its the last buffer in vim
              vim.cmd "quit"                                        -- then close all of vim
            else                                                  -- else there are more tabs open
              vim.api.nvim_win_close(tab_wins[1], true)             -- then close only the tab
            end
          end)
        end
      end
    end
  end

  vim.api.nvim_create_autocmd("WinClosed", {
    callback = function ()
      local winnr = tonumber(vim.fn.expand("<amatch>"))
      vim.schedule_wrap(tab_win_closed(winnr))
    end,
    nested = true
  })

  ----------------------------
  -- nvim-lualine/lualine.nvim
  ----------------------------
  require('lualine').setup {
    options = {
      icons_enabled = true,
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      disabled_filetypes = {},
      always_divide_middle = true,
      globalstatus = true,
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {
        {
          'filename',
          file_status = true,
          path = 2
        }
      },
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {
      lualine_a = {{'buffers', max_length = vim.o.columns}},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {'tabs'}
    },
    extensions = {}
  }

  ---------------------------
  -- chentoast/marks.nvim
  ---------------------------
  require'marks'.setup {
    default_mappings = true,
    builtin_marks = { ".", "<", ">", "^" },
    cyclic = true,
    force_write_shada = false,
    refresh_interval = 250,
    sign_priority = { lower=15, upper=30, builtin=8, bookmark=30 },
    excluded_filetypes = {},
    bookmark_0 = {
      sign = "⚑",
      virt_text = "hello world",
      annotate = false,
    },
    mappings = {
    }
  }

  ---------------------------
  -- nvim-gdb
  ---------------------------
  require'nvim-gdb'.setup({
    logfile = "/tmp/nvim-gdb-lua.log",
    gdb_cli_prompt = '(gdb) ',
    gdb_path = '/usr/bin/gdb',
    gdb_options = {'./main'},
    break_enabled_sign = '🔴',
    break_disabled_sign = '🚫',
    keymap = {
      terminal = {
        exit_to_normal = "<ESC>"
      },
      debug = {
        break_insert = "<CR>",
        run = "<NOP>",
        next = "<F10>",
        step = "<F11>",
        finish = "<leader><F11>",
        abort = "<leader><F5>",
        continue = "<F6>",
      },
      breakpoint = {
        open = "<CR>",
        disable = "dd",
        delete = "D"
      },
    }
  })

  ---------------------------
  -- nvim-cmp
  ---------------------------
  local cmp = require'cmp'

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  local lspkind = require('lspkind')
  cmp.setup({
    sorting = {
      comparators = {
        cmp.config.compare.recently_used,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        cmp.config.compare.offset,
      },
    },
    formatting = {
      format = function(entry, vim_item)
        vim_item.abbr = string.sub(vim_item.abbr, 1, 50)
        return vim_item
      end
    },
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-Space>'] = cmp.mapping.complete(),
      --['<ESC>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }),
      ['<Tab>'] = function(fallback)
        if not cmp.select_next_item() then
          if vim.bo.buftype ~= 'prompt' and has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end
      end,
      ['<C-n>'] = cmp.config.disable,
      ['<C-t>'] = cmp.config.disable,
      ['<S-Tab>'] = function(fallback)
        if not cmp.select_prev_item() then
          if vim.bo.buftype ~= 'prompt' and has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end
      end,
    }),
    sources = cmp.config.sources({
      { priority = 110, name = 'luasnip' },
      { priority = 100, name = 'nvim_lsp' },
      { priority = 90, name = 'path' },
      { priority = 90, name = 'buffer' },
      { priority = 80, name = 'nvim_lsp_signature_help' },
      { priority = 61, name = "nvim_lua",  },
      { priority = 50, name = "dictionary",  },
      { priority = 50, name = "calc",  },
      -- {
      --   priority = 3
      --   name = 'spell',
      --   option = {
      --       keep_all_entries = false,
      --       enable_in_context = function()
      --           return true
      --       end,
      --   },
      -- },
    })
  })

  -- vim.opt.spell = true
  -- vim.opt.spelllang = { 'en_us' }

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      -- You can specify the `cmp_git` source if you were installed it.
      { name = 'cmp_git' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- set highlight
  vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg="NONE", strikethrough = true, fg="#808080" })
  vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg="NONE", fg="#569CD6" })
  vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "CmpItemAbbrMatch" })
  vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg="NONE", fg="#9CDCFE" })
  vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "CmpItemKindVariable" })
  vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "CmpItemKindVariable" })
  vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg="NONE", fg="#C586C0" })
  vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "CmpItemKindFunction" })
  vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg="NONE", fg="#D4D4D4" })
  vim.api.nvim_set_hl(0, "CmpItemKindProperty", { link = "CmpItemKindKeyword" })
  vim.api.nvim_set_hl(0, "CmpItemKindUnit", { link = "CmpItemKindKeyword" })

  ---------------------------
  -- neovim/nvim-lspconfig
  ---------------------------
  local lspattach = function(client, bufnr)
    if client.supports_method('textDocument/documentHighlight') then
        vim.cmd('augroup LspHighlight')
        vim.cmd('autocmd!')
        vim.cmd('autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()')
        vim.cmd('autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()')
        vim.cmd('autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()')
        vim.cmd('augroup END')
    end

    vim.cmd[[hi! def link @number @lsp.type.function]]
    vim.cmd[[hi! def link @type @lsp.type.type]]
    vim.cmd[[hi! def link @macro @lsp.type.macro]]

    vim.cmd[[hi! def link @storageclass @lsp.type.class]]
    vim.cmd[[hi! def link @method @lsp.type.method]]
    vim.cmd[[hi! def link @comment @lsp.type.comment]]
    vim.cmd[[hi! def link @function @lsp.type.function]]
    vim.cmd[[hi! def link @property @lsp.type.property]]
    vim.cmd[[hi! def link @variable @lsp.type.variable]]
    vim.cmd[[hi! def link @namespace @lsp.type.namespace]]
    vim.cmd[[hi! def link @parameter @lsp.type.parameter]]

    vim.cmd[[hi! def link TSComment @lsp.type.comment]]
    vim.cmd[[hi! def link TSConstMacro @lsp.type.macro]]
    vim.cmd[[hi! def link TSFuncBuiltin @lsp.type.function]]
    vim.cmd[[hi! def link TSFuncMacro @lsp.type.macro]]
    vim.cmd[[hi! def link TSFunction @lsp.type.function]]
    vim.cmd[[hi! def link TSMethod @lsp.type.method]]
    vim.cmd[[hi! def link TSNamespace @lsp.type.namespace]]
    vim.cmd[[hi! def link TSParameter @lsp.type.parameter]]
    vim.cmd[[hi! def link TSProperty @lsp.type.property]]
    vim.cmd[[hi! def link TSStorageClass @lsp.type.class]]
    vim.cmd[[hi! def link TSType @lsp.type.type]]
    vim.cmd[[hi! def link TSVariable @lsp.type.variable]]

  end

  -- Set up lspconfig.
  --------------------------------------------------------------------------
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
  }
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities,
    on_attach = lspattach,
    cmd = { "clangd", "--completion-style=detailed" }
  }

  require'lspconfig'.asm_lsp.setup{
    capabilities = capabilities,
    on_attach = lspattach,
  }

  require'lspconfig'.vimls.setup{
    capabilities = capabilities,
    on_attach = lspattach,
  }

  require'lspconfig'.html.setup {
    capabilities = capabilities,
    on_attach = lspattach,
  }

  require'lspconfig'.stylelint_lsp.setup{
    capabilities = capabilities,
    on_attach = lspattach,
    settings = {
      stylelintplus = {
      }
    }
  }

  require'lspconfig'.tsserver.setup{
    capabilities = capabilities,
    on_attach = lspattach,
  }

  require'lspconfig'.jsonls.setup{
    capabilities = capabilities,
    on_attach = lspattach,
  }

  require'lspconfig'.pylsp.setup{
    capabilities = capabilities,
    on_attach = lspattach,
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            ignore = {'W391'},
            maxLineLength = 100
          }
        }
      }
    }
  }

  require'lspconfig'.lua_ls.setup{
    capabilities = capabilities,
    on_attach = lspattach,
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          globals = {'vim'},
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        telemetry = {
          enable = false,
        },
      },
    },
  }

  -- luasnip 
  require("luasnip.loaders.from_vscode").lazy_load()

  --------------------------------------------------------------------------
  vim.cmd [[ autocmd BufRead,BufNewFile *.org set filetype=org ]]
  require'lspconfig'.ltex.setup{
    capabilities = capabilities,
    on_attach = lspattach,
  }

  require'lspconfig'.cmake.setup{
    capabilities = capabilities,
    on_attach = lspattach,
  }

  require'lspconfig'.rust_analyzer.setup{
    capabilities = capabilities,
    on_attach = lspattach,
  }

  require("lsp-file-operations").setup {
    capabilities = capabilities,
    on_attach = lspattach,
    debug = false
  }
  local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = ('  %d '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, {suffix, 'MoreMsg'})
    return newVirtText
  end

  -- global handler
  -- `handler` is the 2nd parameter of `setFoldVirtTextHandler`,
  -- check out `./lua/ufo.lua` and search `setFoldVirtTextHandler` for detail.
 require('ufo').setup({
   fold_virt_text_handler = handler
 })
  --------------------------------------------------------------------------
  -- Global mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  vim.keymap.set('n', 'gi', vim.diagnostic.open_float)
  vim.keymap.set('n', 'gt', vim.diagnostic.goto_prev)
  vim.keymap.set('n', 'gn', vim.diagnostic.goto_next)
  vim.keymap.set('n', 'gl', vim.diagnostic.setloclist)

  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set('n', '<leader><TAB>', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', '<leader><CR>', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gk', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, 'gf', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'g<space>', vim.lsp.buf.references, opts)
      vim.keymap.set({'n', 'x'}, 'g=', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end,
  })

  if vim.fn.exists(vim.g.neovide) then
    -- vim.o.guifont = "CodeNewRoman Nerd Font Mono:style=Bold:h10"
    -- vim.o.guifontwide = "CodeNewRoman Nerd Font Propo:style=Bold:h10"
    
    vim.o.guifont = "CodeNewRoman Nerd Font:style=Regular:h12"
    vim.o.guifontwide = "CodeNewRoman Nerd Font:style=Regular:h12"
    vim.keymap.set("c", "<C-S-v>", "<C-r>+", {
      noremap = true,
    })
    vim.keymap.set("x", "<C-S-v>", "p", {
      noremap = true,
    })
    vim.keymap.set("o", "<C-S-v>", "p", {
      noremap = true,
    })
    vim.keymap.set("i", "<C-S-v>", "<C-r>+", {
      noremap = true,
    })
  end

  local ns_id_eob_active = vim.api.nvim_create_namespace("EOBActive")
  local ns_id_eob_inactive = vim.api.nvim_create_namespace("EOBInactive")
  vim.api.nvim_set_hl(ns_id_eob_inactive, "EndOfBuffer", {fg = "#1F1F1F"})
  vim.api.nvim_set_hl(ns_id_eob_inactive, "NvimTreeEndOfBuffer", {fg = "#1F1F1F"})
  vim.api.nvim_set_hl(ns_id_eob_active, "EndOfBuffer", {fg = "#131313"})
  vim.api.nvim_set_hl(ns_id_eob_active, "NvimTreeEndOfBuffer", {fg = "#131313"})

  vim.cmd[[
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
  hi VertSplit ctermfg=232 guifg=darkgray guibg=#1f1f1f
  """"""""""""""""""""""""""""""
  " ranger settings
  """"""""""""""""""""""""""""""
  let g:ranger_map_keys = 0

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

  highlight EndOfBufferInactive ctermfg=bg guifg=#1f1f1f guibg=#1f1f1f
  highlight EndOfBufferActive ctermfg=bg guifg=#131313 guibg=#131313
  
  " highlight link NvimTreeEndOfBufferInactive EndOfBufferInactive
  " highlight link NvimTreeEndOfBufferActive BufferActive 

  set winhighlight+=EndOfBuffer:EndOfBufferInactive
  
  augroup NrHighlight
    autocmd!
    
    autocmd VimEnter,WinEnter,BufWinEnter * :lua require'user/lib'.activeCurrentWindow()
    autocmd WinLeave * :lua require'user/lib'.inactiveCurrentWindow()
    
    autocmd VimEnter,WinEnter,BufWinEnter * :highlight Normal ctermbg=235 guibg=#131313
    autocmd WinLeave * :highlight Normal ctermbg=235 guibg=#1f1f1f
  augroup END

  highlight CursorLine ctermbg=236 guibg=#2F2B2F

  let g:fcitx5_remote='/usr/bin/fcitx5-remote'
  let g:termdebug_useFloatingHover=1

  """"""""""""""""""""""""""""""
  " vim-diff-enhanced
  """"""""""""""""""""""""""""""
  " started In Diff-Mode set diffexpr (plugin not loaded yet)
  if &diff
      let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
  endif
  ]]
end
  
function Lib.activeCurrentWindow()
  local win_id = vim.api.nvim_get_current_win()
  local ns_id = vim.api.nvim_create_namespace("EOBActive")
  vim.api.nvim_win_set_hl_ns(win_id, ns_id)
end

function Lib.inactiveCurrentWindow()
  local win_id = vim.api.nvim_get_current_win()
  local ns_id = vim.api.nvim_create_namespace("EOBInactive")
  vim.api.nvim_win_set_hl_ns(win_id, ns_id)
end

return Lib
