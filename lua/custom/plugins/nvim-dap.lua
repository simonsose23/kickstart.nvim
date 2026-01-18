return {
  'mfussenegger/nvim-dap',
  config = function()
    local dap = require 'dap'

    -- configure adapters
    dap.adapters.debugpy = {
      type = 'executable',
      command = os.getenv 'HOME' .. '/.venv/bin/python3',
      args = { '-m', 'debugpy.adapter' },
    }

    -- configure debug configurations
    dap.configurations.python = {
      {
        type = 'debugpy',
        request = 'launch',
        name = 'Launch file inside current venv',
        program = '${file}',
        pythonPath = '${workspaceFolder}/.venv/bin/python',
      },
    }
  end,
}
