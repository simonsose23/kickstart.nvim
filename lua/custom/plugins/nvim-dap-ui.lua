local function open_debug_ui()
  local ui = require 'dapui'
  local path = vim.api.nvim_buf_get_name(0)

  vim.api.nvim_command('tabedit ' .. path)

  ui.toggle()
end

return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
  },
  config = function()
    local ui = require 'dapui'

    ui.setup()

    vim.keymap.set('n', '<leader>td', open_debug_ui, { desc = 'Toggle Debugger' })
  end,
}
