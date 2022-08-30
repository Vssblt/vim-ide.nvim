local dap = require('dap')

-- 这个是 cpp 的配置
-- 我没有配 nodejs，这需要你自己配
-- 你需要在 vim 中创建变量： g:dap_cpp_adapter 来控制调试器类型，值可以是 cppdbg 或者 lldb，如果值为空，则使用 cppdbg。

-- This file only work on cpp.
-- You should set g:dap_cpp_adapter in the vim script files. 
if (type(vim.g.dap_cpp_adapter) == nil or vim.g.dap_cpp_adapter == "cppdbg")
then
  dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = '/opt/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
  }
  if (type(vim.g.cpp_executable_program) == "nil") 
  then
    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
        env = function()
          local variables = {}
          for k, v in pairs(vim.fn.environ()) do
            table.insert(variables, string.format("%s=%s", k, v))
          end
          return variables
        end,
      },
      {
        name = 'Attach to gdbserver :1234',
        type = 'cppdbg',
        request = 'launch',
        MIMode = 'gdb',
        miDebuggerServerAddress = 'localhost:1234',
        miDebuggerPath = '/usr/bin/gdb',
        cwd = '${workspaceFolder}',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
      },
    }
  else
    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = vim.g.cpp_executable_program,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
        env = function()
          local variables = {}
          for k, v in pairs(vim.fn.environ()) do
            table.insert(variables, string.format("%s=%s", k, v))
          end
          return variables
        end,
      },
      {
        name = 'Attach to gdbserver on port :1234',
        type = 'cppdbg',
        request = 'launch',
        MIMode = 'gdb',
        miDebuggerServerAddress = 'localhost:1234',
        miDebuggerPath = '/usr/bin/gdb',
        cwd = '${workspaceFolder}',
        program = vim.g.cpp_executable_program,
      },
    }
  end
elseif (vim.g.dap_cpp_adapter == "lldb")
then
  dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode',
    name = 'lldb',
  }
  if (type(vim.g.cpp_executable_program) == "nil")
  then
    dap.configurations.cpp = {
      {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
        env = function()
          local variables = {}
          for k, v in pairs(vim.fn.environ()) do
            table.insert(variables, string.format("%s=%s", k, v))
          end
          return variables
        end,
      },
    }
  else
    dap.configurations.cpp = {
      {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = vim.g.cpp_executable_program,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
        env = function()
          local variables = {}
          for k, v in pairs(vim.fn.environ()) do
            table.insert(variables, string.format("%s=%s", k, v))
          end
          return variables
        end,
      },
    }
  end
end

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

