require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
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
      },
      size = 0.1,
      position = "bottom",
    },
    {
      elements = {
        "repl",
      },
      size = 0.1,
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

