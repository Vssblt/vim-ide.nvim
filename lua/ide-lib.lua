
vim.notify = require("notify")

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

 --vgit.nvim
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


-- aerial.nvim
require("aerial").setup({
  backends = {
    "treesitter", "lsp", "markdown"
  },
  close_behavior = "auto",
  default_bindings = true,
  default_direction = "prefer_right",
  disable_max_lines = 10000,
  disable_max_size = 2000000,
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
  icons = {},
  ignore = {
    unlisted_buffers = true,
    filetypes = {},
    buftypes = "special",
    wintypes = "special",
  },
  link_folds_to_tree = false,
  link_tree_to_folds = true,
  manage_folds = false,
  max_width = {
      40,
      0.2
  },
  width = nil,
  min_width = 20,
  nerd_font = "auto",
  on_attach = nil,
  on_first_symbols = nil,
  open_automatic = false,
  placement_editor_edge = false,
  post_jump_cmd = "normal! zz",
  close_on_select = false,
  show_guides = false,
  update_events = "TextChanged, InsertLeave",
  guides = {
    mid_item = "├─",
    last_item = "└─",
    nested_top = "│ ",
    whitespace = "  ",
  },
  float = {
    border = "rounded",
    relative = "cursor",
    max_height = 0.9,
    height = nil,
    min_height = {
      8, 0.1
    },
    override = function(conf) return conf end,
  },
  lsp = {
    diagnostics_trigger_update = true,
    update_when_errors = true,
    update_delay = 300,
  },
  treesitter = {
    update_delay = 300,
  }, markdown = {
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
