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
vim.o.clipboard = "unnamed,unnamedplus"
vim.o.mouse = a
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
vim.o.updatetime = 300
vim.o.autoread = true
vim.o.signcolumn = "yes"
vim.o.undofile = true
vim.o.completeopt = "longest,menu"

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

---------------------------
-- vim-surround
---------------------------
vim.g.surround_no_mappings = 1

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
-- aerial.nvim
---------------------------
vim.api.nvim_set_hl(0, "AerialLine", { link = "QuickFixLine" })
vim.api.nvim_set_hl(0, "QuickFixLine", { bg = "#848089", fg = "black" })
vim.api.nvim_set_hl(0, "AerialLine", { bg = "#848089", fg = "black" })
vim.api.nvim_set_hl(0, "AerialLineNC", { bg = "#848089" })
vim.api.nvim_set_hl(0, "AerialLine", { link  =  "QuickFixLine" })
vim.api.nvim_set_hl(0, "QuickFixLine", { bg = "#848089", fg = "black" })
vim.api.nvim_set_hl(0, "AerialLine", { bg = "#848089", fg = "black" })
vim.api.nvim_set_hl(0, "AerialLineNC", { bg = "#848089" })

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
vim.g.interestingWordsGUIColors = {'#f85e84', '#ef9062', '#e5c463', '#7accd7', '#ab9df2' }

---------------------------
-- notify
---------------------------
vim.notify = require("notify")

---------------------------
-- nvim-treesitter
---------------------------
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  sync_install = false,
  highlight = {
    enable = false,
    additional_vim_regex_highlighting = false,
  },
}

---------------------------
-- nvim-tree
---------------------------
require("nvim-tree").setup({
  --git = {
    --enable = false,
  --},
  sort_by = "case_sensitive",
  --disable_netrw = true,
  hijack_netrw = true,
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = { "<CR>", "o", "<2-LeftMouse>" },  action = "edit" }
        ,{ key = "<C-e>",                          action = "edit_in_place" }
        ,{ key = "O",                              action = "edit_no_picker" }
        ,{ key = { "cd", "<C-]>", "<2-RightMouse>" },    action = "cd" }
        ,{ key = "<C-v>",                          action = "" }
        ,{ key = "<C-t>",                          action = "" }
        ,{ key = "<C-x>",                          action = "split" }
        ,{ key = ",t",                             action = "tabnew" }
        ,{ key = "<",                              action = "prev_sibling" }
        ,{ key = ">",                              action = "next_sibling" }
        ,{ key = "P",                              action = "parent_node" }
        ,{ key = "<BS>",                           action = "close_node" }
        ,{ key = "<Tab>",                          action = "preview" }
        ,{ key = "K",                              action = "first_sibling" }
        ,{ key = "J",                              action = "last_sibling" }
        ,{ key = "I",                              action = "toggle_git_ignored" }
        ,{ key = "h",                              action = "toggle_dotfiles" }
        ,{ key = "H",                              action = "" }
        ,{ key = "U",                              action = "toggle_custom" }
        ,{ key = "R",                              action = "refresh" }
        ,{ key = "a",                              action = "create" }
        ,{ key = "dd",                             action = "remove" }
        ,{ key = "DD",                             action = "trash" }
        ,{ key = "r",                              action = "rename" }
        ,{ key = "<C-r>",                          action = "full_rename" }
        ,{ key = "x",                              action = "cut" }
        ,{ key = "cc",                             action = "copy" }
        ,{ key = "p",                              action = "paste" }
        ,{ key = "y",                              action = "copy_name" }
        ,{ key = "Y",                              action = "copy_path" }
        ,{ key = "gy",                             action = "copy_absolute_path" }
        ,{ key = "[c",                             action = "prev_git_item" }
        ,{ key = "]c",                             action = "next_git_item" }
        ,{ key = "-",                              action = "dir_up" }
        ,{ key = "s",                              action = "search_node" }
        ,{ key = "S",                              action = "" }
        ,{ key = "f",                              action = "live_filter" }
        ,{ key = "F",                              action = "clear_live_filter" }
        ,{ key = "q",                              action = "close" }
        ,{ key = "W",                              action = "collapse_all" }
        ,{ key = "E",                              action = "expand_all" }
        ,{ key = ".",                              action = "" }
        ,{ key = "<C-k>",                          action = "toggle_file_info" }
        ,{ key = "g?",                             action = "toggle_help" }
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

require('lualine').setup {
  options = {
    icons_enabled = true,
    --theme = 'gruvbox',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
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
--vgit.nvim
---------------------------
require('vgit').setup({
  keymaps = {
    ['n <C-j>'] = function() require('vgit').hunk_up() end,
    ['n <C-k>'] = function() require('vgit').hunk_down() end,
  },
  settings = {
    git = {
      cmd = 'git', -- optional setting, not really required
      fallback_cwd = vim.fn.expand("$HOME"),
      fallback_args = {
        "--git-dir",
        vim.fn.expand("$HOME/dots/yadm-repo"),
        "--work-tree",
        vim.fn.expand("$HOME"),
      },
    },
    hls = {
      GitBackground = 'Normal',
      GitHeader = 'NormalFloat',
      GitFooter = 'NormalFloat',
      GitBorder = 'LineNr',
      GitLineNr = 'LineNr',
      GitComment = 'Comment',
      GitSignsAdd = {
        gui = nil,
        fg = '#d7ffaf',
        bg = nil,
        sp = nil,
        override = false,
      },
      GitSignsChange = {
        gui = nil,
        fg = '#7AA6DA',
        bg = nil,
        sp = nil,
        override = false,
      },
      GitSignsDelete = {
        gui = nil,
        fg = '#e95678',
        bg = nil,
        sp = nil,
        override = false,
      },
      GitSignsAddLn = 'DiffAdd',
      GitSignsDeleteLn = 'DiffDelete',
      GitWordAdd = {
        gui = nil,
        fg = nil,
        bg = '#5d7a22',
        sp = nil,
        override = false,
      },
      GitWordDelete = {
        gui = nil,
        fg = nil,
        bg = '#960f3d',
        sp = nil,
        override = false,
      },
    },
    live_blame = {
      enabled = false,
      format = function(blame, git_config)
        local config_author = git_config['user.name']
        local author = blame.author
        if config_author == author then
          author = 'You'
        end
        local time = os.difftime(os.time(), blame.author_time)
          / (60 * 60 * 24 * 30 * 12)
        local time_divisions = {
          { 1, 'years' },
          { 12, 'months' },
          { 30, 'days' },
          { 24, 'hours' },
          { 60, 'minutes' },
          { 60, 'seconds' },
        }
        local counter = 1
        local time_division = time_divisions[counter]
        local time_boundary = time_division[1]
        local time_postfix = time_division[2]
        while time < 1 and counter ~= #time_divisions do
          time_division = time_divisions[counter]
          time_boundary = time_division[1]
          time_postfix = time_division[2]
          time = time * time_boundary
          counter = counter + 1
        end
        local commit_message = blame.commit_message
        if not blame.committed then
          author = 'You'
          commit_message = 'Uncommitted changes'
          return string.format(' %s • %s', author, commit_message)
        end
        local max_commit_message_length = 255
        if #commit_message > max_commit_message_length then
          commit_message = commit_message:sub(1, max_commit_message_length) .. '...'
        end
        return string.format(
          ' %s, %s • %s',
          author,
          string.format(
            '%s %s ago',
            time >= 0 and math.floor(time + 0.5) or math.ceil(time - 0.5),
            time_postfix
          ),
          commit_message
        )
      end,
    },
    live_gutter = {
      enabled = true,
      edge_navigation = true, -- This allows users to navigate within a hunk
    },
    authorship_code_lens = {
      enabled = true,
    },
    scene = {
      diff_preference = 'unified', -- unified or split
      keymaps = {
        quit = ',Q'
      }
    },
    diff_preview = {
      keymaps = {
        buffer_stage = 'A',
        buffer_unstage = ',U',
        buffer_hunk_stage = 'a',
        buffer_hunk_unstage = ',u',
        toggle_view = ',<TAB>',
        reset = 'R',
      },
    },
    project_diff_preview = {
      keymaps = {
        buffer_stage = 'a',
        buffer_unstage = ',u',
        buffer_hunk_stage = 'o',
        buffer_hunk_unstage = ',O',
        buffer_reset = ',R',
        stage_all = 'A',
        unstage_all = ',U',
        reset_all = ',<C-r>',
      },
    },
    signs = {
      priority = 10,
      definitions = {
        GitSignsAddLn = {
          linehl = 'GitSignsAddLn',
          texthl = nil,
          numhl = nil,
          icon = nil,
          text = '',
        },
        GitSignsDeleteLn = {
          linehl = 'GitSignsDeleteLn',
          texthl = nil,
          numhl = nil,
          icon = nil,
          text = '',
        },
        GitSignsAdd = {
          texthl = 'GitSignsAdd',
          numhl = nil,
          icon = nil,
          linehl = nil,
          text = '┃',
        },
        GitSignsDelete = {
          texthl = 'GitSignsDelete',
          numhl = nil,
          icon = nil,
          linehl = nil,
          text = '┃',
        },
        GitSignsChange = {
          texthl = 'GitSignsChange',
          numhl = nil,
          icon = nil,
          linehl = nil,
          text = '┃',
        },
      },
      usage = {
        screen = {
          add = 'GitSignsAddLn',
          remove = 'GitSignsDeleteLn',
        },
        main = {
          add = 'GitSignsAdd',
          remove = 'GitSignsDelete',
          change = 'GitSignsChange',
        },
      },
    },
    symbols = {
      void = '⣿',
    },
  }
})

---------------------------
-- nvim-surround
---------------------------
require("nvim-surround").setup({ keymaps = { change = "bs" } })

require'marks'.setup {
  -- whether to map keybinds or not. default true
  default_mappings = true,
  -- which builtin marks to show. default {}
  builtin_marks = { ".", "<", ">", "^" },
  -- whether movements cycle back to the beginning/end of buffer. default true
  cyclic = true,
  -- whether the shada file is updated after modifying uppercase marks. default false
  force_write_shada = false,
  -- how often (in ms) to redraw signs/recompute mark positions. 
  -- higher values will have better performance but may cause visual lag, 
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 250,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  sign_priority = { lower=15, upper=30, builtin=8, bookmark=30 },
  -- disables mark tracking for specific filetypes. default {}
  excluded_filetypes = {},
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  bookmark_0 = {
    sign = "⚑",
    virt_text = "hello world",
    -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
    -- defaults to false.
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
-- aerial.nvim
---------------------------

-- Call the setup function to change the default behavior
require("aerial").setup({
  -- Priority list of preferred backends for aerial.
  -- This can be a filetype map (see :help aerial-filetype-map)
  backends = { "treesitter", "lsp", "markdown", "man" },

  layout = {
    -- These control the width of the aerial window.
    -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    -- min_width and max_width can be a list of mixed types.
    -- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
    max_width = { 80, 0.2 },
    width = nil,
    min_width = 10,

    -- key-value pairs of window-local options for aerial window (e.g. winhl)
    win_opts = {},

    -- Determines the default direction to open the aerial window. The 'prefer'
    -- options will open the window in the other direction *if* there is a
    -- different buffer in the way of the preferred direction
    -- Enum: prefer_right, prefer_left, right, left, float
    default_direction = "prefer_right",

    -- Determines where the aerial window will be opened
    --   edge   - open aerial at the far right/left of the editor
    --   window - open aerial to the right/left of the current window
    placement = "window",

    -- Preserve window size equality with (:help CTRL-W_=)
    preserve_equality = false,
  },

  -- Determines how the aerial window decides which buffer to display symbols for
  --   window - aerial window will display symbols for the buffer in the window from which it was opened
  --   global - aerial window will display symbols for the current window
  attach_mode = "window",

  -- List of enum values that configure when to auto-close the aerial window
  --   unfocus       - close aerial when you leave the original source window
  --   switch_buffer - close aerial when you change buffers in the source window
  --   unsupported   - close aerial when attaching to a buffer that has no symbol source
  close_automatic_events = {},

  -- Keymaps in aerial window. Can be any value that `vim.keymap.set` accepts OR a table of keymap
  -- options with a `callback` (e.g. { callback = function() ... end, desc = "", nowait = true })
  -- Additionally, if it is a string that matches "actions.<name>",
  -- it will use the mapping at require("aerial.actions").<name>
  -- Set to `false` to remove a keymap
  keymaps = {
    ["?"] = "actions.show_help",
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.jump",
    ["<2-LeftMouse>"] = "actions.jump",
    ["<C-v>"] = "actions.jump_vsplit",
    ["<C-s>"] = "actions.jump_split",
    ["p"] = "actions.scroll",
    ["<C-j>"] = "actions.up_and_scroll",
    ["<C-k>"] = "actions.down_and_scroll",
    ["{"] = "actions.prev",
    ["}"] = "actions.next",
    ["[["] = "actions.prev_up",
    ["]]"] = "actions.next_up",
    ["q"] = "actions.close",
    ["o"] = "actions.tree_toggle",
    ["za"] = "actions.tree_toggle",
    ["O"] = "actions.tree_toggle_recursive",
    ["zA"] = "actions.tree_toggle_recursive",
    ["l"] = "actions.tree_open",
    ["zo"] = "actions.tree_open",
    ["L"] = "actions.tree_open_recursive",
    ["zO"] = "actions.tree_open_recursive",
    ["h"] = "actions.tree_close",
    ["zc"] = "actions.tree_close",
    ["H"] = false,
    ["zC"] = "actions.tree_close_recursive",
    ["zr"] = "actions.tree_increase_fold_level",
    ["zR"] = "actions.tree_open_all",
    ["zm"] = "actions.tree_decrease_fold_level",
    ["zM"] = "actions.tree_close_all",
    ["zx"] = "actions.tree_sync_folds",
    ["zX"] = "actions.tree_sync_folds",
  },

  -- When true, don't load aerial until a command or function is called
  -- Defaults to true, unless `on_attach` is provided, then it defaults to false
  lazy_load = true,

  -- Disable aerial on files with this many lines
  disable_max_lines = 10000,

  -- Disable aerial on files this size or larger (in bytes)
  disable_max_size = 2000000, -- Default 2MB

  -- A list of all symbols to display. Set to false to display all symbols.
  -- This can be a filetype map (see :help aerial-filetype-map)
  -- To see all available values, see :help SymbolKind
  filter_kind = {
    "Class",
    "Constructor",
    "Enum",
    "Function",
    "Interface",
    "Module",
    "Method",
    "Struct",
  },

  -- Determines line highlighting mode when multiple splits are visible.
  -- split_width   Each open window will have its cursor location marked in the
  --               aerial buffer. Each line will only be partially highlighted
  --               to indicate which window is at that location.
  -- full_width    Each open window will have its cursor location marked as a
  --               full-width highlight in the aerial buffer.
  -- last          Only the most-recently focused window will have its location
  --               marked in the aerial buffer.
  -- none          Do not show the cursor locations in the aerial window.
  highlight_mode = "split_width",

  -- Highlight the closest symbol if the cursor is not exactly on one.
  highlight_closest = true,

  -- Highlight the symbol in the source buffer when cursor is in the aerial win
  highlight_on_hover = false,

  -- When jumping to a symbol, highlight the line for this many ms.
  -- Set to false to disable
  highlight_on_jump = 300,

  -- Jump to symbol in source window when the cursor moves
  autojump = false,

  -- Define symbol icons. You can also specify "<Symbol>Collapsed" to change the
  -- icon when the tree is collapsed at that symbol, or "Collapsed" to specify a
  -- default collapsed icon. The default icon set is determined by the
  -- "nerd_font" option below.
  -- If you have lspkind-nvim installed, it will be the default icon set.
  -- This can be a filetype map (see :help aerial-filetype-map)
  icons = {},

  -- Control which windows and buffers aerial should ignore.
  -- Aerial will not open when these are focused, and existing aerial windows will not be updated
  ignore = {
    -- Ignore unlisted buffers. See :help buflisted
    unlisted_buffers = false,

    -- List of filetypes to ignore.
    filetypes = {},

    -- Ignored buftypes.
    -- Can be one of the following:
    -- false or nil - No buftypes are ignored.
    -- "special"    - All buffers other than normal, help and man page buffers are ignored.
    -- table        - A list of buftypes to ignore. See :help buftype for the
    --                possible values.
    -- function     - A function that returns true if the buffer should be
    --                ignored or false if it should not be ignored.
    --                Takes two arguments, `bufnr` and `buftype`.
    buftypes = "special",

    -- Ignored wintypes.
    -- Can be one of the following:
    -- false or nil - No wintypes are ignored.
    -- "special"    - All windows other than normal windows are ignored.
    -- table        - A list of wintypes to ignore. See :help win_gettype() for the
    --                possible values.
    -- function     - A function that returns true if the window should be
    --                ignored or false if it should not be ignored.
    --                Takes two arguments, `winid` and `wintype`.
    wintypes = "special",
  },

  -- Use symbol tree for folding. Set to true or false to enable/disable
  -- Set to "auto" to manage folds if your previous foldmethod was 'manual'
  -- This can be a filetype map (see :help aerial-filetype-map)
  manage_folds = false,

  -- When you fold code with za, zo, or zc, update the aerial tree as well.
  -- Only works when manage_folds = true
  link_folds_to_tree = false,

  -- Fold code when you open/collapse symbols in the tree.
  -- Only works when manage_folds = true
  link_tree_to_folds = true,

  -- Set default symbol icons to use patched font icons (see https://www.nerdfonts.com/)
  -- "auto" will set it to true if nvim-web-devicons or lspkind-nvim is installed.
  nerd_font = "auto",

  -- Call this function when aerial attaches to a buffer.
  on_attach = function(bufnr) end,

  -- Call this function when aerial first sets symbols on a buffer.
  on_first_symbols = function(bufnr) end,

  -- Automatically open aerial when entering supported buffers.
  -- This can be a function (see :help aerial-open-automatic)
  open_automatic = false,

  -- Run this command after jumping to a symbol (false will disable)
  post_jump_cmd = "normal! zz",

  -- Invoked after each symbol is parsed, can be used to modify the parsed item,
  -- or to filter it by returning false.
  --
  -- bufnr: a neovim buffer number
  -- item: of type aerial.Symbol
  -- ctx: a record containing the following fields:
  --   * backend_name: treesitter, lsp, man...
  --   * lang: info about the language
  --   * symbols?: specific to the lsp backend
  --   * symbol?: specific to the lsp backend
  --   * syntax_tree?: specific to the treesitter backend
  --   * match?: specific to the treesitter backend, TS query match
  post_parse_symbol = function(bufnr, item, ctx)
    return true
  end,

  -- Invoked after all symbols have been parsed and post-processed,
  -- allows to modify the symbol structure before final display
  --
  -- bufnr: a neovim buffer number
  -- items: a collection of aerial.Symbol items, organized in a tree,
  --        with 'parent' and 'children' fields
  -- ctx: a record containing the following fields:
  --   * backend_name: treesitter, lsp, man...
  --   * lang: info about the language
  --   * symbols?: specific to the lsp backend
  --   * syntax_tree?: specific to the treesitter backend
  post_add_all_symbols = function(bufnr, items, ctx)
    return items
  end,

  -- When true, aerial will automatically close after jumping to a symbol
  close_on_select = false,

  -- The autocmds that trigger symbols update (not used for LSP backend)
  update_events = "TextChanged,InsertLeave",

  -- Show box drawing characters for the tree hierarchy
  show_guides = false,

  -- Customize the characters used when show_guides = true
  guides = {
    -- When the child item has a sibling below it
    mid_item = "├─",
    -- When the child item is the last in the list
    last_item = "└─",
    -- When there are nested child guides to the right
    nested_top = "│ ",
    -- Raw indentation
    whitespace = "  ",
  },

  -- Set this function to override the highlight groups for certain symbols
  get_highlight = function(symbol, is_icon)
    -- return "MyHighlight" .. symbol.kind
  end,

  -- Options for opening aerial in a floating win
  float = {
    -- Controls border appearance. Passed to nvim_open_win
    border = "rounded",

    -- Determines location of floating window
    --   cursor - Opens float on top of the cursor
    --   editor - Opens float centered in the editor
    --   win    - Opens float centered in the window
    relative = "cursor",

    -- These control the height of the floating window.
    -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    -- min_height and max_height can be a list of mixed types.
    -- min_height = {8, 0.1} means "the greater of 8 rows or 10% of total"
    max_height = 0.9,
    height = nil,
    min_height = { 8, 0.1 },

    override = function(conf, source_winid)
      -- This is the config that will be passed to nvim_open_win.
      -- Change values here to customize the layout
      return conf
    end,
  },

  -- Options for the floating nav windows
  nav = {
    border = "rounded",
    max_height = 0.9,
    min_height = { 10, 0.1 },
    max_width = 0.5,
    min_width = { 0.2, 20 },
    win_opts = {
      cursorline = true,
      winblend = 10,
    },
    -- Jump to symbol in source window when the cursor moves
    autojump = false,
    -- Show a preview of the code in the right column, when there are no child symbols
    preview = false,
    -- Keymaps in the nav window
    keymaps = {
      ["<CR>"] = "actions.jump",
      ["<2-LeftMouse>"] = "actions.jump",
      ["<C-v>"] = "actions.jump_vsplit",
      ["<C-s>"] = "actions.jump_split",
      ["h"] = "actions.left",
      ["l"] = "actions.right",
      ["<C-c>"] = "actions.close",
    },
  },

  lsp = {
    -- Fetch document symbols when LSP diagnostics update.
    -- If false, will update on buffer changes.
    diagnostics_trigger_update = true,

    -- Set to false to not update the symbols when there are LSP errors
    update_when_errors = true,

    -- How long to wait (in ms) after a buffer change before updating
    -- Only used when diagnostics_trigger_update = false
    update_delay = 300,

    -- Map of LSP client name to priority. Default value is 10.
    -- Clients with higher (larger) priority will be used before those with lower priority.
    -- Set to -1 to never use the client.
    priority = {
      -- pyright = 10,
    },
  },

  treesitter = {
    -- How long to wait (in ms) after a buffer change before updating
    update_delay = 300,
  },

  markdown = {
    -- How long to wait (in ms) after a buffer change before updating
    update_delay = 300,
  },

  man = {
    -- How long to wait (in ms) after a buffer change before updating
    update_delay = 300,
  },
})

-- Set up nvim-cmp.
local cmp = require'cmp'

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local lspkind = require('lspkind')
cmp.setup({
  formatting = {
    format = lspkind.cmp_format(),
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
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
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
    { name = 'nvim_lsp' },
     { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  })
})

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

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['clangd'].setup {
  capabilities = capabilities
}

require'lspconfig'.vimls.setup{
  capabilities = capabilities,
}

require'lspconfig'.html.setup {
  capabilities = capabilities,
}

require'lspconfig'.stylelint_lsp.setup{
  capabilities = capabilities,
  settings = {
    stylelintplus = {
    }
  }
}

require'lspconfig'.tsserver.setup{
  capabilities = capabilities,
}

require'lspconfig'.jsonls.setup{
  capabilities = capabilities,
}

require'lspconfig'.pylsp.setup{
  capabilities = capabilities,
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

vim.cmd [[ autocmd BufRead,BufNewFile *.org set filetype=org ]]
require'lspconfig'.ltex.setup{
  capabilities = capabilities,
}

require'lspconfig'.cmake.setup{
  capabilities = capabilities,
}

require'lspconfig'.rust_analyzer.setup{
  capabilities = capabilities,
}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', 'gi', vim.diagnostic.open_float)
vim.keymap.set('n', 'gt', vim.diagnostic.goto_prev)
vim.keymap.set('n', 'gn', vim.diagnostic.goto_next)
vim.keymap.set('n', 'gl', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', '<leader><TAB>', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', '<leader><CR>', vim.lsp.buf.definition, opts)
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

