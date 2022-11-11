-- nvim-treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  sync_install = false,
  highlight = {
    enable = false,
    additional_vim_regex_highlighting = false,
  },
}

-- nvim-tree
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" }
        ,{ key = "<C-e>",                          action = "edit_in_place" }
        ,{ key = "O",                              action = "edit_no_picker" }
        ,{ key = { "cd", "<C-]>", "<2-RightMouse>" },    action = "cd" }
        ,{ key = "<C-v>",                          action = "" }
        ,{ key = "<C-x>",                          action = "split" }
        ,{ key = ",t",                          action = "tabnew" }
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
        ,{ key = "dd",                              action = "remove" }
        ,{ key = "DD",                              action = "trash" }
        ,{ key = "r",                              action = "rename" }
        ,{ key = "<C-r>",                          action = "full_rename" }
        ,{ key = "x",                              action = "cut" }
        ,{ key = "cc",                              action = "copy" }
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
    theme = 'gruvbox',
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
    lualine_a = {'buffers'},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'tabs'}
  },
  extensions = {}
}

-- dap debugger
require('dap/dap')
require('dap/ft-dap-cpp')
require('dap/dap-ui')
require('dap/dap-virtual-text')

-- nvim-gps
require("nvim-gps").setup()

-- winbar
require('winbar').setup(
{
    enabled = true,

    show_file_path = true,
    show_symbols = true,

    colors = {
        path = '',
        file_name = '',
        symbols = '',
    },

    icons = {
        file_icon_default = '',
        seperator = '>',
        editor_state = '●',
        lock_icon = '',
    },

    exclude_filetype = {
        'help',
        'startify',
        'dashboard',
        'packer',
        'neogitstatus',
        'NvimTree',
        'Trouble',
        'alpha',
        'lir',
        'Outline',
        'spectre_panel',
        'toggleterm',
        'qf',
        'dap-repl',
        'dapui_console',
        'dapui_stacks',
        'dapui_scopes',
        'dapui_breakpoints',
        'dapui_watches',
    }
}
)

-- bufresize.nvim
require("bufresize").setup(
  {
      register = {
          keys = {
          },
          trigger_events = { "WinNew", "BufWinEnter", "WinClosed" ,"WinEnter" ,"WinLeave" ,"WinScrolled" },
      },
      resize = {
          keys = {},
          trigger_events = { "VimResized" },
          increment = 1,
      },
  }
)

 --vgit.nvim
require('vgit').setup({
  keymaps = {
    ['n <C-j>'] = function() require('vgit').hunk_up() end,
    ['n <C-k>'] = function() require('vgit').hunk_down() end,
    --['n <leader>gs'] = function() require('vgit').buffer_hunk_stage() end,
    --['n <leader>gr'] = function() require('vgit').buffer_hunk_reset() end,
    --['n <leader>gp'] = function() require('vgit').buffer_hunk_preview() end,
    --['n <leader>gb'] = function() require('vgit').buffer_blame_preview() end,
    --['n <leader>gf'] = function() require('vgit').buffer_diff_preview() end,
    --['n <leader>gh'] = function() require('vgit').buffer_history_preview() end,
    --['n <leader>gu'] = function() require('vgit').buffer_reset() end,
    --['n <leader>gg'] = function() require('vgit').buffer_gutter_blame_preview() end,
    --['n <leader>glu'] = function() require('vgit').buffer_hunks_preview() end,
    --['n <leader>gls'] = function() require('vgit').project_hunks_staged_preview() end,
    --['n <leader>gd'] = function() require('vgit').project_diff_preview() end,
    --['n <leader>gq'] = function() require('vgit').project_hunks_qf() end,
    --['n <leader>gx'] = function() require('vgit').toggle_diff_preference() end,
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
      enabled = true,
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
