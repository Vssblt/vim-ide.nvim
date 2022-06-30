local dap = require('dap')

dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
  name = 'lldb'
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
  },
}
end

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

