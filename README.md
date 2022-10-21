# vim-ide.nvim
```
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
    use { 'wbthomason/packer.nvim', after = 'vim-ide.nvim'}
    use { 'Vssblt/vim-ide.nvim' }

    --------------------------------------------------------------------------
    -- Those plugins take effect automatically.

    -- use { 'Vssblt/vim-airline-cwd'  }
 
    --use { 'ryanoasis/vim-devicons'  }
 
    use { 'embear/vim-localvimrc'  }
 
    --use { 'kshenoy/vim-signature'  }
 
    -- use { 'vim-airline/vim-airline'  }
    -- use { 'vim-airline/vim-airline-themes', after = 'vim-airline' }
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

 
    use { 'yianwillis/vimcdoc'  }
    -- vim chinese doc
 
    use { 'lilydjwg/fcitx.vim'  }
    
    use { 'plasticboy/vim-markdown'  }
    -- markdown highlight
 
    use { 'suan/vim-instant-markdown'  }
    -- this plugin will automatically open web browser when you editing markdown files.
 
    -- use { 'Vssblt/vim-cpp'  }
    -- cpp syntax
 
    use { 'mzlogin/vim-markdown-toc'  }
    -- this plugin open your browser when you open a markdown file
 
    use { 'jackguo380/vim-lsp-cxx-highlight'  }
    -- this plugin probely cause slow.
    
    use { 'adi/vim-indent-rainbow'  }
 
    use { 'unblevable/quick-scope'  }
    --------------------------------------------------------------------------
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
 
    use { 'preservim/nerdcommenter'  }
    -- [count]<leader>cc |NERDCommenterComment|
    -- Comment out the current line or text selected in visual mode.
    -- 
    -- [count]<leader>cn |NERDCommenterNested|
    -- Same as cc but forces nesting.
    -- 
    -- [count]<leader>c<space> |NERDCommenterToggle|
    -- Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa.
    -- 
    -- [count]<leader>cm |NERDCommenterMinimal|
    -- Comments the given lines using only one set of multipart delimiters.
    -- 
    -- [count]<leader>ci |NERDCommenterInvert|
    -- Toggles the comment state of the selected line(s) individually.
    -- 
    -- [count]<leader>cs |NERDCommenterSexy|
    -- Comments out the selected lines with a pretty block formatted layout.
    -- 
    -- [count]<leader>cy |NERDCommenterYank|
    -- Same as cc except that the commented line(s) are yanked first.
    -- 
    -- <leader>c$ |NERDCommenterToEOL|
    -- Comments the current line from the cursor to the end of line.
    -- 
    -- <leader>cA |NERDCommenterAppend|
    -- Adds comment delimiters to the end of line and goes into insert mode between them.
    -- 
    -- |NERDCommenterInsert|
    -- Adds comment delimiters at the current cursor position and inserts between. Disabled by default.
    -- 
    -- <leader>ca |NERDCommenterAltDelims|
    -- Switches to the alternative set of delimiters.
    -- 
    -- [count]<leader>cl |NERDCommenterAlignLeft [count]<leader>cb |NERDCommenterAlignBoth
    -- Same as |NERDCommenterComment| except that the delimiters are aligned down the left side (<leader>cl) or both sides (<leader>cb).
    -- 
    -- [count]<leader>cu |NERDCommenterUncomment|
    -- Uncomments the selected line(s).
 
    use { 'dhruvasagar/vim-table-mode'  }
    -- use <leader>tm open table mode
    -- use | <text> | to create table unit.
    -- use || to create |+++++++++|
 
    use { 'easymotion/vim-easymotion'  }
    -- <leader>.
    -- search one chara
    -- 
    -- <leader><leader>.
    -- search a string
    -- 
    -- <leader>d
    -- go start in current line
    -- 
    -- <leader>-
    -- go end in current line
    -- 
    -- <leader>uh/<leader>ut/<leader>un/<leader>us
    -- go somewhere
 
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

    use { 'voldikss/vim-floaterm'  }
    -- :FloatermNew
    -- <leader><leader>n
    -- open a new floaterm popup window
    -- 
    -- :FloatermHide        rename: FHide
    -- <leader><leader>h
    -- hide floaterm popup windows
    -- 
    -- :FloatermNext        rename: FNext
    -- show next floaterm window
    -- 
    -- :FloatermPrev        rename: FPrev
    -- show prev floaterm window
    -- 
    -- :FloatermFirst       rename: FFirst
    -- show first floaterm window
    -- 
    -- :FloatermLast        rename: FLast
    -- show last floaterm window
    -- 
    -- :FloatermShow        rename: FShow
    -- <leader><leader>s
    -- show current floaterm window
    -- 
    -- <C-D>
    -- close current floaterm window

    use { 'flazz/vim-colorschemes'  }
    --:colorscheme [color theme]

    use { 'francoiscabrol/ranger.vim'  }
    -- <leader>o
    -- open a file in new tab.

    use { 'neoclide/coc.nvim', branch = 'release', run = 'yarn install' }
    -- :CocInstall
    -- install coc plugin
    -- 
    -- :CocConfig
    -- config coc plugin
    -- 
    -- :CocCommand
    -- run coc command
    -- 
    -- :CocDisable/CocEnable
    -- disable or enable coc plugin
    -- 
    -- :CocUpdate
    -- update coc plugin
    --  

    use { 'voldikss/vim-translator'  }
    --:Translate/TranslateX/TranslateW/TranslateH/TranslateL/TranslateR
    
    use { 'wellle/targets.vim'  }
    -- Targets.vim is a Vim plugin that adds various text objects to give 
    -- you more targets to operate on. It expands on the idea of simple 
    -- commands like di' (delete inside the single quotes around the cursor) 
    -- to give you more opportunities to craft powerful commands that can 
    -- be repeated reliably. One major goal is to handle all corner cases 
    -- correctly.
    -- 
    -- [ydc]i[",[]{}().<>']
    -- copy, delete or change text between the characters.
    
    use { 'kkoomen/vim-doge', after = {"vim-ide.nvim"}}
    -- gc
    -- Add doxygen document on class, function or the other definitions.
    -- <c-n> 
    -- Jump forward position.
    -- <c-t>
    -- Jump backward position.
    
    use { 'tpope/vim-surround'  }
    -- ydc s iw 
    --------------------------------------------------------------------------
    --Other pluins.
 
    use { 'sainnhe/sonokai'  }
    --colorscheme
    use { 'morhetz/gruvbox'  }
    --colorscheme
 
    use { 'srstevenson/vim-picker'  }
 
    use { 'google/vim-maktaba'  }
    use { 'google/vim-glaive', after = {'vim-maktaba'} }
    use { 'google/vim-codefmt', after = {'vim-glaive'} }
 
    use { 'artoj/qmake-syntax-vim'  }
 
    use { 'junegunn/vim-easy-align'  }
 
    use { 'brooth/far.vim'  }
 
    use { 'vim-scripts/genutils'  }
 
    use { 'godlygeek/tabular'  }
    --highlight
 
    use { 'tpope/vim-dispatch'  }
 
    use { 'aperezdc/vim-template'  }
 
    use { 'junegunn/fzf', run = 'cd ~/.fzf && ./install --all' }
 
    use { 'junegunn/fzf.vim'  } 

    use { 'antoinemadec/coc-fzf'  }
 
    use { 'honza/vim-snippets'  }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }

    use {
      'Vssblt/aerial.nvim',
      config = function() require('aerial').setup() end,
    }

    use {
      'kyazdani42/nvim-web-devicons'
    }

    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly', -- optional, updated every week. (see issue #1193)
    }

    use 'sindrets/winshift.nvim'

    use {
	    "SmiteshP/nvim-gps",
	    requires = "nvim-treesitter/nvim-treesitter"
    }

    use {
      'fgheng/winbar.nvim',
      requires = {
        'kyazdani42/nvim-web-devicons',
        'SmiteshP/nvim-gps',
      },
    }

    use {
      "kwkarlwang/bufresize.nvim",
    }

    -- Lua
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
        {
          position = "bottom", -- position of the list can be: bottom, top, left, right
          height = 10, -- height of the trouble list when position is top or bottom
          width = 50, -- width of the list when position is left or right
          icons = true, -- use devicons for filenames
          mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
          fold_open = "", -- icon used for open folds
          fold_closed = "", -- icon used for closed folds
          group = true, -- group results by file
          padding = true, -- add an extra new line on top of the list
          action_keys = { -- key mappings for actions in the trouble list
              -- map to {} to remove a mapping, for example:
              -- close = {},
              close = "q", -- close the list
              cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
              refresh = "r", -- manually refresh
              jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
              open_split = { "<c-x>" }, -- open buffer in new split
              open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
              open_tab = { "<c-t>" }, -- open buffer in new tab
              jump_close = {"o"}, -- jump to the diagnostic and close the list
              toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
              toggle_preview = "P", -- toggle auto_preview
              hover = "K", -- opens a small popup with the full multiline message
              preview = "p", -- preview the diagnostic location
              close_folds = {"zM", "zm"}, -- close all folds
              open_folds = {"zR", "zr"}, -- open all folds
              toggle_fold = {"zA", "za"}, -- toggle fold of current file
              previous = "k", -- preview item
              next = "j" -- next item
          },
          indent_lines = true, -- add an indent guide below the fold icons
          auto_open = false, -- automatically open the list when you have diagnostics
          auto_close = false, -- automatically close the list when you have no diagnostics
          auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
          auto_fold = false, -- automatically fold a file trouble list at creation
          auto_jump = {"lsp_definitions"}, -- for the given modes, automatically jump if there is only a single result
          signs = {
              -- icons / text used for a diagnostic
              error = "",
              warning = "",
              hint = "",
              information = "",
              other = "﫠"
          },
          use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
        }
        }
      end
    }

    -- debugger
    --------------------------------------------------------------------------
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

    use { 'ravenxrz/DAPInstall.nvim', requires = {"mfussenegger/nvim-dap"} }

    use { 'theHamsta/nvim-dap-virtual-text', requires = {"mfussenegger/nvim-dap"}   }
    --------------------------------------------------------------------------

end)

```
