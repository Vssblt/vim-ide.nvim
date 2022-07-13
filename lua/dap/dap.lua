local dap = require'dap'
local repl = require 'dap.repl'
repl.commands = vim.tbl_extend('force', repl.commands, {
  exit = {}, -- There are some bugs which make custom commands invaild and not working. The alias will not working if you defined here.
  continue = {'.continue', '.c', 'c', 'continue'},
  next_ = {'.next', '.n', 'n', 'next'},
  step_back = {'.back', '.b', 'rn', 'reverse-next', '.rn', '.reverse-next'},
  reverse_continue = {'.reverse-continue', '.rc', 'reverse-continue', 'rc'},
  into = {'.into', 's' ,'.s', 'into' },
  into_targets = {'.into-targets'},
  out = {'.out', 'fin', 'finish', '.fin', '.finish'},
  scopes = {'.scopes', 'p', '.p', 'print', '.print'},
  threads = {'.threads', 'threads'},
  frames = {'.frames', 'bt', '.bt','backtraces', '.backtraces'},
  up = {'.up', 'up'},
  down = {'.down', 'down'},
  goto_ = {'.goto', 'goto'},
  pause = {'.pause', 'pause'},
  capabilities = {'.capabilities', 'capabilities'},
  help = {'help', '.help', '.h'},

  custom_commands = {
    ['echo'] = function(text)
      dap.repl.append(text)
    end,
    -- I must define multiple same custom commands with difference alias name.
    ['exit'] = function(text)
      require('dap').terminate()
      require('dap').disconnect()
      require('dap').repl.close()
      require('dapui').close()
    end,
    ['q'] = function(text)
      require('dap').terminate()
      require('dap').disconnect()
      require('dap').repl.close()
      require('dapui').close()
    end,
    ['quit'] = function(text)
      require('dap').terminate()
      require('dap').disconnect()
      require('dap').repl.close()
      require('dapui').close()
    end,
    ['.q'] = function(text)
      require('dap').terminate()
      require('dap').disconnect()
      require('dap').repl.close()
      require('dapui').close()
    end,
    ['.exit'] = function(text)
      require('dap').terminate()
      require('dap').disconnect()
      require('dap').repl.close()
      require('dapui').close()
    end,
    ------
  },
}
)
