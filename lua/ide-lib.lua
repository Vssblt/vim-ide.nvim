
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
        ,{ key = { "<C-]>", "<2-RightMouse>" },    action = "cd" }
        ,{ key = "<C-v>",                          action = "" }
        ,{ key = "<C-x>",                          action = "split" }
        ,{ key = "<C-t>",                          action = "tabnew" }
        ,{ key = "<",                              action = "prev_sibling" }
        ,{ key = ">",                              action = "next_sibling" }
        ,{ key = "P",                              action = "parent_node" }
        ,{ key = "<BS>",                           action = "close_node" }
        ,{ key = "<Tab>",                          action = "preview" }
        ,{ key = "K",                              action = "first_sibling" }
        ,{ key = "J",                              action = "last_sibling" }
        ,{ key = "I",                              action = "toggle_git_ignored" }
        ,{ key = "H",                              action = "toggle_dotfiles" }
        ,{ key = "U",                              action = "toggle_custom" }
        ,{ key = "R",                              action = "refresh" }
        ,{ key = "a",                              action = "create" }
        ,{ key = "d",                              action = "remove" }
        ,{ key = "D",                              action = "trash" }
        ,{ key = "r",                              action = "rename" }
        ,{ key = "<C-r>",                          action = "full_rename" }
        ,{ key = "x",                              action = "cut" }
        ,{ key = "c",                              action = "copy" }
        ,{ key = "p",                              action = "paste" }
        ,{ key = "y",                              action = "copy_name" }
        ,{ key = "Y",                              action = "copy_path" }
        ,{ key = "gy",                             action = "copy_absolute_path" }
        ,{ key = "[c",                             action = "prev_git_item" }
        ,{ key = "]c",                             action = "next_git_item" }
        ,{ key = "-",                              action = "dir_up" }
        ,{ key = "s",                              action = "" }
        ,{ key = "f",                              action = "live_filter" }
        ,{ key = "F",                              action = "clear_live_filter" }
        ,{ key = "q",                              action = "close" }
        ,{ key = "W",                              action = "collapse_all" }
        ,{ key = "E",                              action = "expand_all" }
        ,{ key = "S",                              action = "search_node" }
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

-- dap debugger
require('dap/ft-dap-cpp')
require('dap/dap-ui')
