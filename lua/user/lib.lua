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
vim.o.updatetime = 300
vim.o.autoread = true
vim.o.signcolumn = "yes"
vim.o.undofile = true
vim.o.completeopt = "menu,menuone,noselect,noinsert"
vim.o.termguicolors = true

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
vim.api.nvim_create_user_command("FHide", "FloatermHide", { bang = true })
vim.api.nvim_create_user_command("FNext", "FloatermNext", { bang = true })
vim.api.nvim_create_user_command("FFirst", "FloatermFirst", { bang = true })
vim.api.nvim_create_user_command("FKill", "FloatermKill", { bang = true })
vim.api.nvim_create_user_command("FLast", "FloatermLast", { bang = true })
vim.api.nvim_create_user_command("FPrev", "FloatermPrev", { bang = true })
vim.api.nvim_create_user_command("FShow", "FloatermShow", { bang = true })

vim.api.nvim_create_user_command("VConfig", "e " .. vim.g.plugindir .. "/plugin/01config.vim", { bang = true })
vim.api.nvim_create_user_command("VHConfig", "e " .. vim.g.plugindir .. "/plugin/02lib.vim", { bang = true })
vim.api.nvim_create_user_command("Vlua", "e " .. vim.g.plugindir .. "/lua/user/lib.lua", { bang = true })
vim.api.nvim_create_user_command("VPlugList", "e ~/.config/nvim/init.lua", { bang = true })
vim.api.nvim_create_user_command("DvorakSettingsV", "e " .. vim.g.plugindir .. "/plugin/03map.vim", { bang = true })
vim.api.nvim_create_user_command("Bda", "bufdo bwipeout", { bang = true })

vim.api.nvim_create_autocmd({"CursorHold"}, { command = "lua vim.lsp.buf.document_highlight()" })
vim.api.nvim_create_autocmd({"CursorHoldI"}, { command = "lua vim.lsp.buf.document_highlight()" })
vim.api.nvim_create_autocmd({"CursorMoved"}, { command = "lua vim.lsp.buf.clear_references()" })

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
local function change_root_cwd()
  vim.cmd(":tcd " .. require'nvim-tree.api'.tree.get_nodes().absolute_path)
end

vim.api.nvim_create_autocmd({"BufWinLeave", "WinLeave", "TabLeave", }, { pattern = {"NvimTree_*"}, callback = change_root_cwd})

local function on_attach(bufnr)
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
  on_attach = on_attach,
  hijack_netrw = true,
  view = {
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

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
-- aerial.nvim
---------------------------

require("aerial").setup({
  backends = { "treesitter", "lsp", "markdown", "man" },

  layout = {
    max_width = { 80, 0.2 },
    width = nil,
    min_width = 10,

    win_opts = {},

    default_direction = "prefer_right",

    placement = "window",

    preserve_equality = false,
  },

  attach_mode = "window",

  close_automatic_events = {},

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

  lazy_load = true,

  disable_max_lines = 10000,

  disable_max_size = 2000000, -- Default 2MB

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

  highlight_mode = "split_width",

  highlight_closest = true,

  highlight_on_hover = false,

  highlight_on_jump = 300,

  autojump = false,

  icons = {},

  ignore = {
    unlisted_buffers = false,

    filetypes = {},

    buftypes = "special",

    wintypes = "special",
  },

  manage_folds = false,

  link_folds_to_tree = false,

  link_tree_to_folds = true,

  nerd_font = "auto",

  on_attach = function(bufnr) end,

  on_first_symbols = function(bufnr) end,

  open_automatic = false,

  post_jump_cmd = "normal! zz",

  post_parse_symbol = function(bufnr, item, ctx)
    return true
  end,

  post_add_all_symbols = function(bufnr, items, ctx)
    return items
  end,

  close_on_select = false,

  update_events = "TextChanged,InsertLeave",

  show_guides = false,

  guides = {
    mid_item = "├─",
    last_item = "└─",
    nested_top = "│ ",
    whitespace = "  ",
  },

  get_highlight = function(symbol, is_icon)
  end,

  float = {
    border = "rounded",

    relative = "cursor",

    max_height = 0.9,
    height = nil,
    min_height = { 8, 0.1 },

    override = function(conf, source_winid)
      return conf
    end,
  },

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
    autojump = false,
    preview = false,
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
    diagnostics_trigger_update = true,

    update_when_errors = true,

    update_delay = 300,

    priority = {
    },
  },

  treesitter = {
    update_delay = 300,
  },

  markdown = {
    update_delay = 300,
  },

  man = {
    update_delay = 300,
  },
})

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
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'nvim_lsp_signature_help' },
    -- {
    --     name = 'spell',
    --     option = {
    --         keep_all_entries = false,
    --         enable_in_context = function()
    --             return true
    --         end,
    --     },
    -- },
    { name = 'luasnip' },
    { name = 'buffer' },
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

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['clangd'].setup {
  capabilities = capabilities,
  cmd = { "clangd", "--completion-style=detailed" }
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

require("lsp-file-operations").setup {
  capabilities = capabilities,
  debug = false
}

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
  vim.o.guifont = "CodeNewRoman Nerd Font Mono:style=Bold:h10"
  vim.o.guifontwide = "CodeNewRoman Nerd Font Propo:style=Bold:h10"
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
