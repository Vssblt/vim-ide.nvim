#! /usr/bin/env lua
--
-- init.lua
-- Copyright (C) 2023 Vincent Sun <sunruiyangcp01@gmail.com>
--
-- Distributed under terms of the MIT license.
--

vim.loader.enable()

-- Disable netrw and matchparen
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
-- vim.g.matchparen_timeout = 2
-- vim.g.matchparen_insert_timeout = 2
-- vim.g.loaded_matchparen = 1


-- load lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local priority = 1000 -- maximum priority
local function getPriority()
  priority = priority - 1
  return priority
end

require("lazy").setup({
  --------------------------------------------------------------------------
  { 'google/vim-maktaba', priority = getPriority() },
  { 'google/vim-glaive', priority = getPriority() },
  { 'google/vim-codefmt', priority = getPriority() },
  --------------------------------------------------------------------------
  { "folke/neodev.nvim", priority = getPriority(), },
  {
    "klen/nvim-config-local",
    init = function()
      require('config-local').setup {
        config_files = { ".nvim.lua", ".nvimrc", ".exrc", ".vimrc.lua", ".vimrc" },
        hashfile = vim.fn.stdpath("data") .. "/config-local",
        autocommands_create = true,
        commands_create = true,
        silent = true,
        lookup_parents = false,
      }
    end,
    priority = getPriority(),
  },

  {
    'kyazdani42/nvim-web-devicons',
    priority = getPriority(),
  },

  {
    'nvim-lualine/lualine.nvim',
    priority = getPriority(),
    -- Better Tab and buffer line.
  },

  {
    'yianwillis/vimcdoc',
    priority = getPriority(),
    -- vim/nvim chinese doc
  },

  {
    'lilydjwg/fcitx.vim',
    priority = getPriority(),
    -- Autoswitch fcitx input method between the insert mode and normal mode.
  },

  {
    'godlygeek/tabular',
    priority = getPriority(),
    -- Required by plasticboy/vim-markdown align
    -- http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
  },

  {
    'plasticboy/vim-markdown',
    priority = getPriority(),
    -- Syntax highlighting, matching rules and mappings for the original Markdown and extensions.
  },

  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
    priority = getPriority(),
    init = function()
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
    end
    -- Open web browser automatically when you editing markdown files.
    -- markdown preview
  },

  {
    'mzlogin/vim-markdown-toc',
    priority = getPriority(),
    -- A vim 7.4+ plugin to generate table of contents for Markdown files.
    -- :GenTocGFM
  },

  {
    'unblevable/quick-scope',
    priority = getPriority(),
  },

  {
    'rcarriga/nvim-notify',
    priority = getPriority(),
  },

  {
    'dstein64/vim-startuptime',
    priority = getPriority(),
  },

  {
    'glepnir/dashboard-nvim',
    priority = getPriority(),
  },

  {
    'goolord/alpha-nvim',
    config = function()
      require('dashboard').setup {
        theme = 'doom',
        shortcut_type = 'number',
      }
      local dashboard = require("alpha.themes.dashboard")
      local function footer()
        local plugin_status = " Plugins " .. vim.fn.len(vim.fn.globpath("$HOME/.local/share/nvim/lazy/", "*", 0, 1))
        local datetime = os.date("󰸗 %m-%d-%Y    %H:%M:%S   ")
        local version = vim.version()
        local nvim_version_info = "v" .. version.major .. "." .. version.minor .. "." .. version.patch .. "   "
        return " ⚡Neovim ".. nvim_version_info .. datetime .. plugin_status
      end
      dashboard.section.header.opts.hl = "Type"
      dashboard.section.footer.opts.hl = "Type"

      dashboard.section.footer.val = footer();
      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find file", ":lua require('fzf-lua').files({ fzf_opts = {['--layout'] = 'reverse-list'}, winopts = { preview = { layout = 'flex', flip_columns = 200 } } })<CR>"),
        dashboard.button("e", "󰈔  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", "  Recently files", ":lua require('fzf-lua').oldfiles({ fzf_opts = {['--layout'] = 'reverse-list'}, winopts = { preview = { layout = 'flex', flip_columns = 200 } } })<CR>"),
        dashboard.button("p", "  Extension List", ":Vinit<CR>"),
        dashboard.button("c", "󱁤  Configuration", ":Vlib<CR>"),
        dashboard.button("u", "  Update Plugins", ":Lazy update<CR>"),
        dashboard.button("q", "󰅙  Quit Neovim", ":qa<CR>"),
      }
      local dashboard_height = 24
      if vim.o.lines > dashboard_height then
        dashboard.opts.layout[1].val = math.floor((vim.o.lines - dashboard_height) / 3)
      end
      require'alpha'.setup(dashboard.opts)
    end,
    priority = getPriority(),
  },

  --------------------------------------------------------------------------
  { 'hrsh7th/nvim-cmp', priority = getPriority(), },
  { 'hrsh7th/cmp-buffer', priority = getPriority(), },
  { 'hrsh7th/cmp-path', priority = getPriority(), },
  { 'hrsh7th/cmp-cmdline', priority = getPriority(), },
  { 'hrsh7th/cmp-nvim-lsp', priority = getPriority(), },
  { 'f3fora/cmp-spell', priority = getPriority(), },
  { 'hrsh7th/cmp-nvim-lua', priority = getPriority(), },
  { 'hrsh7th/cmp-calc', priority = getPriority(), },
  { 'lukas-reineke/cmp-rg', priority = getPriority(), },
  { 'uga-rosa/cmp-dictionary', priority = getPriority(), },
  

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
    build = ":MasonUpdate",
    priority = getPriority(),
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup()
    end,
    priority = getPriority(),
  },

  {
    "neovim/nvim-lspconfig",
    priority = getPriority(),
  },

  {
    'hrsh7th/cmp-nvim-lsp-signature-help',
    priority = getPriority(),
  },

  {
    "rafamadriz/friendly-snippets",
    priority = getPriority()
  },

  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    priority = getPriority(),
    dependencies = { "rafamadriz/friendly-snippets" },
  },

  { 'saadparwaiz1/cmp_luasnip', priority = getPriority() },

  {
    'onsails/lspkind.nvim', priority = getPriority()
    -- completion menu style
  },

  -- lua lsp
  {
    'luals/lua-language-server',
    build = [[
      which lua-language-server
      (( $? == 0 )) && exit 0
      sudo apt install ninja-build -y
      ./make.sh
      sudo ln -s `pwd`/bin/lua-language-server /usr/bin/lua-language-server
    ]],
    timeout = 360,
    priority = getPriority()
  },
  -- rust lsp
  {
    'rust-lang/rust-analyzer',
    version = "2023-01-02",
    build = "cargo xtask install --server",
    timeout = 360,
    priority = getPriority()
  },

  { 'nvim-lua/plenary.nvim', priority = getPriority() },

  {
    'kyazdani42/nvim-tree.lua',
    priority = getPriority(),
  },

  {
    'antosha417/nvim-lsp-file-operations',
    priority = getPriority(),
  },

  --------------------------------------------------------------------------
  {
    'chentoast/marks.nvim',
    priority = getPriority()
    -- Show signature in the left mark column.
    -- mx              Set mark x
    -- m,              Set the next available alphabetical (lowercase) mark
    -- m;              Toggle the next available mark at the current line
    -- dmx             Delete mark x
    -- dm-             Delete all marks on the current line
    -- dm<space>       Delete all marks in the current buffer
    -- m]              Move to next mark
    -- m[              Move to previous mark
    -- m:              Preview mark. This will prompt you for a specific mark to
    --                 preview; press <cr> to preview the next mark.
    -- m[0-9]          Add a bookmark from bookmark group[0-9].
    -- dm[0-9]         Delete all bookmarks from bookmark group[0-9].
    -- m}              Move to the next bookmark having the same type as the bookmark under
    --                 the cursor. Works across buffers.
    -- m{              Move to the previous bookmark having the same type as the bookmark under
    --                 the cursor. Works across buffers.
    -- dm=             Delete the bookmark under the cursor.
  },

  {
    'tpope/vim-fugitive', priority = getPriority()
    -- git commands.
  },

  {
    'lambdalisue/suda.vim', priority = getPriority()
    -- Re-open a current file with sudo
    -- :SudaRead

    -- Open /etc/sudoers with sudo
    -- :SudaRead /etc/sudoers
    --
    -- Forcedly save a current file with sudo
    -- :SudaWrite

    -- Write contents to /etc/profile
    -- :SudaWrite /etc/profile
  },

  {
    'lfv89/vim-interestingwords', priority = getPriority()
    -- Highlight the words.
    -- <leader>k
    -- highlight current word
    --
    -- <leader>K
    -- clear highlight
    --
    -- l
    -- Navigate highlighted words
    --
    -- L
    -- Navigate highlighted words
  },

  {
    'Vssblt/leetcode.vim', priority = getPriority()
    -- Open leetcode in vim.
    --
    -- :LeetCodeList
    -- Open Leetcode index
    --
    -- :LeetCodeTest
    -- Test the code
    --
    -- :LeetCodeReset
    -- Reset code
    --
    -- :LeetCodeSignIn
    -- Sign in leetcode
    --
    -- :LeetCodeSubmit
    -- Submit the code
  },

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup(
        {
          padding = true,
          sticky = true,
          ignore = nil,
          toggler = {
              line = ',cc',
              block = ',c<space>',
          },
          opleader = {
              line = ',cc',
              block = ',c<space>',
          },
          extra = {
              above = ',cO',
              below = ',co',
              eol = ',cA',
          },
          mappings = {
              basic = true,
              extra = true,
          },
          pre_hook = nil,
          post_hook = nil,
        }
      )
    end,
    priority = getPriority(),
  },

  {
    'dhruvasagar/vim-table-mode', priority = getPriority(),
    -- use <leader>tm open table mode
    -- use | <text> | to create table unit.
    -- use || to create |+++++++++|
  },

  {
    'Vssblt/vim-choosewin', priority = getPriority()
    -- type . to switch window
  },

  {
    'mg979/vim-visual-multi',
    priority = getPriority(),
    init = function()
      vim.cmd[[
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
      ]]
    end

    -- ctrl + n
    -- select current word and create a cursor
    --
    -- ctrl + v and ctrl + n
    -- select a text and create a cursor
    --
    -- n  and  N
    -- select next/prev text and create a cursor
    --
    -- [  and  ]
    -- select next/prev
    --
    -- q
    -- skip current text and select next text
    --
    -- Q
    -- delete current cursor
  },

  {
    'yssl/QFEnter', priority = getPriority()
    -- if in quickfix window:
    -- <Enter>, <2-LeftMouse>
    -- open
    --
    -- <Leader><Enter>
    -- split and open in left window
    --
    -- <Leader><Space>
    -- split and open in top window
    --
    -- <Leader><Tab>
    -- open in new tab
  },

  {
    'akinsho/toggleterm.nvim',
    config = function ()
      require("toggleterm").setup{}
    end,
    priority = getPriority(),
  },

  {
    'rbgrouleff/bclose.vim',
    config = function()
      vim.g.bclose_no_plugin_maps = true
    end,
    priority = getPriority()
  },

  {
    'francoiscabrol/ranger.vim',
    priority = getPriority(),
    -- <leader>o
    -- open a file in new tab.
  },

  {
    'Vssblt/vim-translator', priority = getPriority()
    --:Translate/TranslateX/TranslateW/TranslateH/TranslateL/TranslateR
  },

  {
    "kylechui/nvim-surround",
    version = "v2.0.5", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
          keymaps={change="bs"}
        })
    end,
    priority = getPriority(),
    -- ydc s iw/$/]/t
    -- Select a text and type: S"
  },
  --------------------------------------------------------------------------

  {
    'Vssblt/sonokai',
    priority = getPriority(),
  },

  { 'morhetz/gruvbox', priority = getPriority(),  },

  { 'srstevenson/vim-picker', priority = getPriority(),  },

  { 'artoj/qmake-syntax-vim', priority = getPriority(),  },

  { 'junegunn/vim-easy-align', priority = getPriority(),  },

  { 'brooth/far.vim', priority = getPriority(),  },

  { 'tpope/vim-dispatch', priority = getPriority(),  },

  { 'aperezdc/vim-template', priority = getPriority(),  },

  {
    'junegunn/fzf',
    build = 'cd ~/.fzf && ./install --all',
    priority = getPriority(),
  },

  {
    'ibhagwan/fzf-lua',
    priority = getPriority(),
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    priority = getPriority(),
  },
  
  {
    'Badhi/nvim-treesitter-cpp-tools',
    priority = getPriority(),
    config = function()
      require 'nt-cpp-tools'.setup({
        preview = {
            quit = 'q',
            accept = '<tab><cr>'
        },
        header_extension = 'h',
        source_extension = 'cpp',
        custom_define_class_function_commands = {
            TSCppImplWrite = {
                output_handle = require'nt-cpp-tools.output_handlers'.get_add_to_cpp()
            }
        }
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    priority = getPriority(),
  },

  {
    "shellRaining/hlchunk.nvim",
    config = function()
      require('hlchunk').setup(
        {
          indent = {
            use_treesitter = false,
            chars = { "│" },
            style = {
              { fg = "#39363e" }
           },
          },
          chunk = {
            enable = true,
            use_treesitter = true,
            notify = true,
            exclude_filetypes = {
              aerial = true,
              dashboard = true,
              Outline = true,
              qf = true,
            },
            chars = {
              horizontal_line = "─",
              vertical_line = "│",
              left_top = "┌",
              left_bottom = "└",
              right_arrow = ">",
            },
            style = {
              { fg = "lightblue" },
            },
          },
          blank = {
            enable = false,
            use_treesitter = true,
          },
          line_num = {
            enable = true,
            use_treesitter = true,
            style = {
              { fg = "lightblue" }
            }
          },
        }
      )
    end,
    priority = getPriority(),
  },
  {
    'stevearc/aerial.nvim',
    opts = {},
    config = function()
      require("aerial").setup({
        backends = { "treesitter", "lsp", "markdown", "man" },
        layout = {
          max_width = nil,
          width = nil,
          min_width = nil,
          win_opts = {},
          default_direction = "prefer_left",
          placement = "window",
          resize_to_content = false,
          preserve_equality = false,
        },
        attach_mode = "window",
        close_automatic_events = {},
        keymaps = {
          ["?"] = "actions.show_help",
          ["g?"] = false,
          ["<CR>"] = "actions.jump",
          ["<2-LeftMouse>"] = "actions.jump",
          ["<tab>v"] = "actions.jump_vsplit",
          ["<tab>s"] = "actions.jump_split",
          ["p"] = false,
          ["<C-n>"] = "actions.down_and_scroll",
          ["<c-t>"] = "actions.up_and_scroll",
          ["{"] = "actions.prev",
          ["}"] = "actions.next",
          ["[["] = "actions.prev_up",
          ["]]"] = "actions.next_up",
          ["q"] = "actions.close",
          ["o"] = false,
          ["za"] = "actions.tree_toggle",
          ["O"] = false,
          ["zA"] = "actions.tree_toggle_recursive",
          ["l"] = false,
          ["zo"] = "actions.tree_open",
          ["L"] = false,
          ["zO"] = "actions.tree_open_recursive",
          ["h"] = false,
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
        filter_kind = false,
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
          get_highlight = function(symbol, is_icon, is_collapsed)
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
              ["<tab>v"] = "actions.jump_vsplit",
              ["<tab>s"] = "actions.jump_split",
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
            experimental_selection_range = false,
          },
          markdown = {
            update_delay = 300,
          },
          man = {
            update_delay = 300,
          },
        })
      end
    },
    
  {
    'sindrets/winshift.nvim',
    priority = getPriority(),
  },

  {
    'stevearc/stickybuf.nvim', config = function() require('stickybuf').setup() end, priority = getPriority()
    -- for debug cpp project.
  },

  {
    'tikhomirov/vim-glsl', priority = getPriority()
    -- for vim glsl enhance
  },

  {
    'chrisbra/vim-diff-enhanced', priority = getPriority()
    -- for enhance diff use this
    -- :EnhancedDiff histogram
  },

  {
    'moll/vim-bbye',
    priority = getPriority(),
    -- This plug can delete buffer without closing window and breaking the layout.
  },

 {
   'Vssblt/nvim-gdb.lua',
   priority = getPriority(),
 },

  {
    'Vssblt/luagdb.nvim',
    priority = getPriority(),
  },

  {
    'kkoomen/vim-doge',
    build = ':call doge#install()',
    priority = getPriority(),
    init = function()
      vim.g.doge_mapping='gc'
      vim.g.doge_mapping_comment_jump_forward='<c-n>'
      vim.g.doge_mapping_comment_jump_backward='<c-t>'
      vim.g.doge_doc_standard_cpp='doxygen_javadoc'
    end,
    -- gc
    -- Add doxygen document on class, function or the other definitions.
    -- <c-n>
    -- Jump forward position.
    -- <c-t>
    -- Jump backward position.
  },
  {
    'kevinhwang91/promise-async',
    priority = getPriority()
  },
  {
    'kevinhwang91/nvim-ufo',
    priority = getPriority()
  },
  {
    "folke/edgy.nvim",
    config = function()
      vim.cmd[[hi EdgyTitle cterm=bold ctermfg=203 gui=bold guifg=#f85e84 guibg=#1f1f1f]]
      vim.cmd[[hi EdgyIconActive ctermfg=215 guifg=#ef9062 guibg=#1f1f1f]]
      vim.cmd[[hi EdgyIcon ctermfg=215 guifg=#ef9062 guibg=#1f1f1f]]
      -- vim.cmd[[hi EdgyWinBar ctermfg=215 guifg=#848089 guibg=#1f1f1f]]
      vim.cmd[[hi EdgyNormal ctermfg=250 ctermbg=235 guifg=#d3d1d4 guibg=#131313]]
      
      
      vim.cmd[[hi WinBarNC ctermfg=215 guifg=#848089 guibg=#1f1f1f]]
      vim.cmd[[hi WinBar ctermfg=215 guifg=#848089 guibg=#1f1f1f]]

      require'edgy'.setup({
        left = {
          {
            title = "Undo-Tree",
            ft = "undotree",
            size = { height = 0.3}
          },
          {
            title = "Undo-Tree-Diff",
            ft = "diff",
            size = { height = 0.3}
          },
          -- {
          --   title = "scope",
          --   ft = "ltgdb-scope",
          --   size = { height = 0.5}
          -- },
          -- {
          --   title = "Stack",
          --   ft = "ltgdb-stack",
          --   size = { height = 0.5}
          -- },
          -- {
          --   title = "Watch",
          --   ft = "ltgdb-watch",
          --   size = { height = 0.5}
          -- },
          {
            title = "Nvim-Tree",
            ft = "NvimTree",
            size = { height = 0.5}
          },
          {
            title = "Aerial",
            ft = "aerial",
            size = { height = 0.5}
          },
          {
            title = "Breakpoint",
            ft = "ltgdb-breakpoint",
            size = { height = 0.5}
          },
          {
            title = "Scope",
            ft = "ltgdb-scope",
            size = { height = 0.5}
          },
          {
            title = "Watch",
            ft = "ltgdb-watch",
            size = { height = 0.5}
          },
          {
            title = "Stack",
            ft = "ltgdb-stack",
            size = { height = 0.5}
          },
        },
        bottom = {
          {
            title = "Quick Fix",
            ft = "qf",
          },
          {
            title = "GDB Console",
            ft = "ltgdb-terminal",
          },
        },
        right = {
        },
        top = {
          {
            title = "Standard Output",
            ft = "ltgdb-gdbout",
          },
        },

        options = {
          left = { size = 35 },
          bottom = { size = 14 },
          right = { size = 35 },
          top = { size = 18 },
        },
        animate = {
          enabled = true,
          fps = 165,
          cps = 250,
          on_begin = function()
            vim.g.minianimate_disable = true
          end,
          on_end = function()
            vim.g.minianimate_disable = true
          end,
          spinner = {
            frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
            interval = 80,
          },
        },
        exit_when_last = true,
        close_when_all_hidden = true,
        wo = {
          winbar = true,
          winfixwidth = true,
          winfixheight = true,
          spell = false,
          signcolumn = "no",
        },
        keys = {
          ["q"] = function(win)
            win:close()
          end,
          ["Q"] = function(win)
            win:hide()
          end,
          -- [""] = function(win)
          --   win.view.edgebar:close()
          -- end,
        },
        icons = {
          closed = " ",
          open = " ",
        },
        fix_win_height = vim.fn.has("nvim-0.10.0") == 0,
      })
    end,
    event = "VeryLazy",
    priority = getPriority()
  },
  {
    "mbbill/undotree",
    priority = getPriority(),
    config = function()
    end
  },
  {
    "akinsho/bufferline.nvim",
    priority = getPriority(),
    config = function()
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",
          diagnostics_update_in_insert = false,
          diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or ""
            return icon .. "  " .. count
          end,
          offsets = {
            {
              filetype = "diff",
              text = "Toolbar",
              text_align = "left",
              separator = true
            },
            {
              filetype = "undotree",
              text = "Toolbar",
              text_align = "left",
              separator = true
            },
            {
              filetype = "aerial",
              text = "Toolbar",
              text_align = "left",
              separator = true
            },
            {
              filetype = "NvimTree",
              text = "Toolbar",
              text_align = "left",
              separator = true
            },
            {
              filetype = "ltgdb-stack",
              text = "Toolbar",
              text_align = "left",
              separator = true
            },
            {
              filetype = "ltgdb-breakpoint",
              text = "Toolbar",
              text_align = "left",
              separator = true
            },
            {
              filetype = "ltgdb-watch",
              text = "Toolbar",
              text_align = "left",
              separator = true
            }
          }
        },
      })
    end
  },
})

local Lib = require('user/lib')
local Map = require('user/map')

Lib.setup()
Map.setup()
