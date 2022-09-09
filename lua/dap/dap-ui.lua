if (vim.g.is_vertical == true)
then
  require("dapui").setup({
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
      expand = { "<CR>", "<2-LeftMouse>", "<TAB>" },
      open = {"o", "<CR>", "<TAB>", "<2-LeftMouse>"},
      remove = "dd",
      edit = "a",
      repl = "<leader>re",
      toggle = "<leader>to",
    },
    expand_lines = vim.fn.has("nvim-0.7"),
    layouts = {
      {
        elements = {
          "stacks",
        },
        size = 0.1,
        position = "top",
      },
      {
        elements = {
          "scopes",
          "breakpoints",
        },
        size = 0.1,
        position = "top",
      },
      {
        elements = {
          "console",
          "repl",
        },
        size = 0.2,
        position = "bottom",
      },
    },
    floating = {
      max_height = nil, -- These can be integers or a float between 0 and 1.
      max_width = nil, -- Floats will be treated as percentage of your screen.
      border = "single", -- Border style. Can be "single", "double" or "rounded"
      mappings = {
        close = { "q", "<Esc>" },
      },
    },
    windows = { indent = 1 },
    render = {
      max_type_length = nil, -- Can be integer or nil.
    }
  })

  local dap, dapui = require("dap"), require("dapui")
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({reset = true})
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dap.repl.close()
    dap.disconnect()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dap.repl.close()
    dap.disconnect()
    dapui.close()
  end
else
  require("dapui").setup({
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
      expand = { "K", "<CR>", "<2-LeftMouse>", "<TAB>" },
      open = {"o", "<CR>", "<TAB>", "<2-LeftMouse>"},
      remove = "dd",
      edit = "a",
      repl = "<leader>re",
      toggle = "<leader>to",
    },
    expand_lines = vim.fn.has("nvim-0.7"),
    layouts = {
      {
        elements = {
          "stacks",
          "console",
          "repl",
        },
        size = 0.25,
        position = "bottom",
      },
      {
        elements = {
          "scopes",
          "breakpoints",
          "watches",
        },
        size = 0.20,
        position = "right",
      },
    },
    floating = {
      max_height = nil, -- These can be integers or a float between 0 and 1.
      max_width = nil, -- Floats will be treated as percentage of your screen.
      border = "single", -- Border style. Can be "single", "double" or "rounded"
      mappings = {
        close = { "q", "<Esc>" },
      },
    },
    windows = { indent = 1 },
    render = {
      max_type_length = nil, -- Can be integer or nil.
    }
  })

  local dap, dapui = require("dap"), require("dapui")
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({reset = true})
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dap.repl.close()
    dap.disconnect({ terminateDebuggee = true })
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dap.repl.close()
    dap.disconnect({ terminateDebuggee = true })
    dapui.close()
  end
end
