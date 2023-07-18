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
vim.g.matchparen_timeout = 2
vim.g.matchparen_insert_timeout = 2
vim.g.loaded_matchparen = 1


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
    config = function()
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
    'dhruvasagar/vim-table-mode', priority = getPriority()
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

  { 'Vssblt/sonokai', priority = getPriority() },

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
    "nvim-treesitter/nvim-treesitter-textobjects",
    priority = getPriority(),
  },

  {
    "shellRaining/hlchunk.nvim",
    config = function()
      require('hlchunk').setup({
        indent = {
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
          },
          chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = ">",
          },
          style = {
            { fg = "#806d9c" },
          },
        },
        blank = {
          enable = false,
        }
      })
    end,
    priority = getPriority(),
  },

  {
    'simrat39/symbols-outline.nvim',
    config = function()
      local opts = {
        highlight_hovered_item = true,
        show_guides = true,
        auto_preview = false,
        position = 'right',
        relative_width = true,
        width = 18,
        auto_close = true,
        show_numbers = false,
        show_relative_numbers = false,
        show_symbol_details = true,
        preview_bg_highlight = 'Pmenu',
        autofold_depth = nil,
        auto_unfold_hover = true,
        fold_markers = { '', '' },
        wrap = false,
        keymaps = {
          close = {"q"},
          goto_location = "<Cr>",
          focus_location = "o",
          hover_symbol = "<C-space>",
          toggle_preview = "K",
          rename_symbol = "r",
          code_actions = "a",
        },
        lsp_blacklist = {},
        symbol_blacklist = {},
        symbols = {
          File = { icon = "", hl = "@text.uri" },
          Module = { icon = "", hl = "@namespace" },
          Namespace = { icon = "", hl = "@namespace" },
          Package = { icon = "", hl = "@namespace" },
          Class = { icon = "󰙱", hl = "@type" },
          Method = { icon = "ƒ", hl = "@method" },
          Property = { icon = "", hl = "@method" },
          Field = { icon = "󰽑", hl = "@field" },
          Constructor = { icon = "", hl = "@constructor" },
          Enum = { icon = "ℰ", hl = "@type" },
          Interface = { icon = "ﰮ", hl = "@type" },
          Function = { icon = "󰡱", hl = "@function" },
          Variable = { icon = "", hl = "@constant" },
          Constant = { icon = "󰏿", hl = "@constant" },
          String = { icon = "𝓐", hl = "@string" },
          Number = { icon = "#", hl = "@number" },
          Boolean = { icon = "⊨", hl = "@boolean" },
          Array = { icon = "", hl = "@constant" },
          Object = { icon = "⦿", hl = "@type" },
          Key = { icon = "", hl = "@type" },
          Null = { icon = "󰟢", hl = "@type" },
          EnumMember = { icon = "", hl = "@field" },
          Struct = { icon = "𝓢", hl = "@type" },
          Event = { icon = "", hl = "@type" },
          Operator = { icon = "+", hl = "@operator" },
          TypeParameter = { icon = "𝙏", hl = "@parameter" },
          Component = { icon = "", hl = "@function" },
          Fragment = { icon = "", hl = "@constant" },
        },
      }
      require("symbols-outline").setup(opts)
    end,
    priority = getPriority(),
  },

  {
    'sindrets/winshift.nvim',
    priority = getPriority(),
  },

  {
    'tanvirtin/vgit.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
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
})

local Lib = require('user/lib')
local Map = require('user/map')

Lib.setup()
Map.setup()

