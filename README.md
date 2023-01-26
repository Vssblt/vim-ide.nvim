# vim-ide.nvim
``` lua
_G.__luacache_config = {
  chunks = {
    enable = true,
    path = vim.fn.stdpath('cache')..'/luacache_chunks',
  },
  modpaths = {
    enable = true,
    path = vim.fn.stdpath('cache')..'/luacache_modpaths',
  }
}
require('impatient').enable_profile()

vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
    use { 'Vssblt/vim-ide.nvim', after = 'vim-glaive' }
    use { 'wbthomason/packer.nvim' }
    -- For manage plugs.
    use { 'lewis6991/impatient.nvim' }
    -- For speed up lua execution.

    --------------------------------------------------------------------------
    -- Those plugins take effect automatically.
    use { "folke/neodev.nvim" }
    -- The lsp for lua development.

    use { 'embear/vim-localvimrc' }
    -- Autoload the '.lvimrc' in current directory.

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
    -- For plasticboy/vim-markdown align
    -- http://vimcasts.org/episodes/aligning-text-with-tabular-vim/

    use { 'plasticboy/vim-markdown', requires = { 'godlygeek/tabular' } }
    -- Syntax highlighting, matching rules and mappings for the original Markdown and extensions.

    use { 'suan/vim-instant-markdown' }
    -- Open web browser automatically when you editing markdown files.

    use { 'mzlogin/vim-markdown-toc'  }
    -- A vim 7.4+ plugin to generate table of contents for Markdown files.

    use { 'jackguo380/vim-lsp-cxx-highlight'  }
    -- This plugin probely make vim slowly.

    use { 'adi/vim-indent-rainbow'  }

    use { 'unblevable/quick-scope'  }
    -- Quick move in current line.
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

    use { 'sainnhe/sonokai'  }
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

    use { 'junegunn/fzf.vim' }

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
      requires = 'kyazdani42/nvim-web-devicons', -- optional, for file icons
      tag = 'nightly', -- optional, updated every week. (see issue #1193)
    }

    use {'sindrets/winshift.nvim'}

    use {
	    "SmiteshP/nvim-gps",
	    requires = "nvim-treesitter/nvim-treesitter", 
    }

    use {
      'fgheng/winbar.nvim',
      requires = {
        'kyazdani42/nvim-web-devicons',
        'SmiteshP/nvim-gps',
      },
    }

    use {
      "kwkarlwang/bufresize.nvim"
    }

    use {
      "Vssblt/light-gdb.nvim"
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
    use { "mfussenegger/nvim-dap"}

    use { "rcarriga/nvim-dap-ui", requires = "mfussenegger/nvim-dap"}

    use { 'ravenxrz/DAPInstall.nvim', requires = "mfussenegger/nvim-dap"}

    use { 'theHamsta/nvim-dap-virtual-text', requires = "mfussenegger/nvim-dap" }
    --------------------------------------------------------------------------

    use { 'nvim-lua/plenary.nvim' }

    use {
      'tanvirtin/vgit.nvim',
      requires = 'nvim-lua/plenary.nvim'
    }

    use {
      'anuvyklack/pretty-fold.nvim',
      config = function()
        require('pretty-fold').setup(
         {
            sections = {
               left = {
                  'content',
               },
               right = {
                  ' ', 'number_of_folded_lines', ': ', 'percentage', ' ',
                  function(config) return config.fill_char:rep(3) end
               }
            },
            fill_char = '•',
            remove_fold_markers = true,
            -- Keep the indentation of the content of the fold string.
            keep_indentation = true,
            -- Possible values:
            -- "delete" : Delete all comment signs from the fold string.
            -- "spaces" : Replace all comment signs with equal number of spaces.
            -- false    : Do nothing with comment signs.
            process_comment_signs = 'spaces',
            -- Comment signs additional to the value of `&commentstring` option.
            comment_signs = {},
            -- List of patterns that will be removed from content foldtext section.
            stop_words = {
               '@brief%s*', -- (for C++) Remove '@brief' and all spaces after.
            },
            add_close_pattern = true, -- true, 'last_line' or false
            matchup_patterns = {
               {  '{', '}' },
               { '%(', ')' }, -- % to escape lua pattern char
               { '%[', ']' }, -- % to escape lua pattern char
            },
            ft_ignore = { 'neorg' },
          }
        )
      end
    }

    use { 'Vssblt/nvim-gdb.lua' }

end)
```
