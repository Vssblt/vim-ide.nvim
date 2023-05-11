``` lua
vim.loader.enable()

-- Disable netrw 
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
vim.g.matchparen_timeout = 2
vim.g.matchparen_insert_timeout = 2

-- ABOUT MATCHPAREN.VIM
-- this plug is a part of the vim distribution.
-- It may casue lag!
vim.g.loaded_matchparen = 1

vim.cmd [[packadd packer.nvim]]

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]]

return require('packer').startup(function()
  use {
    'Vssblt/vim-ide.nvim',
    after = { 'vim-maktaba', 'vim-glaive', 'vim-codefmt' },
    run = 'sudo apt install gem npm perl rust-all && sudo npm -g install tree-sitter-cli neovim vim-language-server vscode-langservers-extracted stylelint-lsp typescript typescript-language-server && sudo cpan install Neovim::Ext App::cpanminus && sudo gem install neovim && sudo pip install python-lsp-server cmake-language-server'
  }

  use { 'wbthomason/packer.nvim' }
  -- For manage plugs.

  --------------------------------------------------------------------------
  -- These plugins take effect automatically.

  use { "folke/neodev.nvim" }
  -- The lsp for lua development.

  use {
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
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }
  -- Better Tab and buffer line.

  use { 'yianwillis/vimcdoc' }
  -- vim/nvim chinese doc

  use { 'lilydjwg/fcitx.vim' }
  -- Autoswitch fcitx input method between the insert mode and normal mode.

  use { 'godlygeek/tabular' }
  -- Required by plasticboy/vim-markdown align
  -- http://vimcasts.org/episodes/aligning-text-with-tabular-vim/

  use { 'plasticboy/vim-markdown', requires = { 'godlygeek/tabular' } }
  -- Syntax highlighting, matching rules and mappings for the original Markdown and extensions.

  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })
  -- Open web browser automatically when you editing markdown files.
  -- markdown preview

  use { 'mzlogin/vim-markdown-toc'  }
  -- A vim 7.4+ plugin to generate table of contents for Markdown files.
  -- :GenTocGFM

  use { "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup()
    end
  }

  -- { 
  -- These plugins have poor performance!!!!
    use { 'unblevable/quick-scope'  }
    -- Quick move in current line.
  -- }

  use { 'rcarriga/nvim-notify' }

  use { 'dstein64/vim-startuptime' }

  use {
      'goolord/alpha-nvim',
      config = function()
        require('dashboard').setup {
          theme = 'doom',
          shortcut_type = 'number',
        }
        local dashboard = require("alpha.themes.dashboard")
        dashboard.section.buttons.val = {
        	dashboard.button("f", "  Find file", ":lua require('fzf-lua').files({ fzf_opts = {['--layout'] = 'reverse-list'}, winopts = { preview = { layout = 'flex', flip_columns = 200 } } })<CR>"),
        	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        	dashboard.button("r", "  Recently used files", ":lua require('fzf-lua').oldfiles({ fzf_opts = {['--layout'] = 'reverse-list'}, winopts = { preview = { layout = 'flex', flip_columns = 200 } } })<CR>"),
        	dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
        	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
        }
        require'alpha'.setup(dashboard.opts)
      end,
      requires = { 'glepnir/dashboard-nvim' }
  }
  --------------------------------------------------------------------------

  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'f3fora/cmp-spell' }
  use { 'neovim/nvim-lspconfig' }
  use({
	  "L3MON4D3/LuaSnip",
	  run = "make install_jsregexp"
  })
  -- completion menu style
  use { 'onsails/lspkind.nvim' }
  -- lua lsp
  use { 'luals/lua-language-server', run = "sudo apt install ninja-build && ./make.sh && sudo ln -s `pwd`/bin/lua-language-server /usr/bin/lua-language-server" }
  -- rust lsp
  use { 'rust-lang/rust-analyzer', run = "cargo xtask install --server" }

  --------------------------------------------------------------------------

  use { 'chentoast/marks.nvim' }
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

  use { 'tpope/vim-fugitive' }
  -- git commands.

  use { 'lambdalisue/suda.vim'  }
  -- Re-open a current file with sudo
  -- :SudaRead

  -- Open /etc/sudoers with sudo
  -- :SudaRead /etc/sudoers
  --
  -- Forcedly save a current file with sudo
  -- :SudaWrite

  -- Write contents to /etc/profile
  -- :SudaWrite /etc/profile

  use { 'lfv89/vim-interestingwords'  }
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

  use { 'Vssblt/leetcode.vim'  }
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

  use {
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
    end
  }

  use { 'dhruvasagar/vim-table-mode'  }
  -- use <leader>tm open table mode
  -- use | <text> | to create table unit.
  -- use || to create |+++++++++|

  use { 'Vssblt/vim-choosewin'  }
  -- type . to switch window

  use { 'mg979/vim-visual-multi'  }
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

  use { 'yssl/QFEnter'  }
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

  use { 'akinsho/toggleterm.nvim',
    config = function ()
      require("toggleterm").setup{}
    end
  }
  
  use { 'flazz/vim-colorschemes'  }
  --:colorscheme [color theme]

  use { 'rbgrouleff/bclose.vim', config = function() vim.g.bclose_no_plugin_maps = true end }

  use {
    'francoiscabrol/ranger.vim',
    requires = { 'rbgrouleff/bclose.vim' }
  }
  -- <leader>o
  -- open a file in new tab.

  use { 'Vssblt/vim-translator' }
  --:Translate/TranslateX/TranslateW/TranslateH/TranslateL/TranslateR

  use { 'kkoomen/vim-doge', run = ':call doge#install()', after = 'vim-ide.nvim' }
  -- gc
  -- Add doxygen document on class, function or the other definitions.
  -- <c-n>
  -- Jump forward position.
  -- <c-t>
  -- Jump backward position.

  use {
    "kylechui/nvim-surround",
    tag = "*" -- Use for stability; omit to use `main` branch for the latest features
  }
  -- ydc s iw/$/]/t
  -- Select a text and type: S"
  --------------------------------------------------------------------------
  --Other pluins.

  use { 'Vssblt/sonokai'  }
  --colorscheme
  use { 'morhetz/gruvbox'  }
  --colorscheme

  use { 'srstevenson/vim-picker'  }

  use { 'google/vim-maktaba' }
  use { 'google/vim-glaive', after = 'vim-maktaba' }
  use { 'google/vim-codefmt', opt=false, after = 'vim-glaive' }

  use { 'artoj/qmake-syntax-vim'  }

  use { 'junegunn/vim-easy-align'  }

  use { 'brooth/far.vim'  }

  --use { 'vim-scripts/genutils'  }

  use { 'tpope/vim-dispatch'  }

  use { 'aperezdc/vim-template'  }

  use { 'junegunn/fzf', run = 'cd ~/.fzf && ./install --all' }

  use { 'ibhagwan/fzf-lua',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
  }
  
  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })

  use { 'stevearc/aerial.nvim' }

  use {
    'kyazdani42/nvim-web-devicons'
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons', -- optional, for file icons
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
  }

  use {'sindrets/winshift.nvim'}

  use {
    "Vssblt/light-gdb.nvim"
  }

  use { 'nvim-lua/plenary.nvim' }

  use {
    'tanvirtin/vgit.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }

  use { 'Vssblt/nvim-gdb.lua', requires = { 'stevearc/stickybuf.nvim', 'rcarriga/nvim-notify' } }
  use { 'stevearc/stickybuf.nvim', config = function() require('stickybuf').setup() end }
  ---- for debug cpp project.

  use { 'tikhomirov/vim-glsl' }
  -- for vim glsl enhance

  use { 'chrisbra/vim-diff-enhanced' }
  -- for enhance diff use this
  -- :EnhancedDiff histogram
  -- use {
  --   "folke/which-key.nvim",
  --   config = function()
  --     vim.o.timeout = true
  --     vim.o.timeoutlen = 300
  --     require("which-key").setup {
  --     }
  --   end
  -- }
  
  use { 'moll/vim-bbye' }
  -- This plug can delete buffer without closing window and breaking the layout.
 
end)
```
