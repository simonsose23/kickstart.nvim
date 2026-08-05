return {
  url = 'https://github.com/nvimdev/indentmini.nvim',
  cmd = { 'IndentToggle', 'IndentEnable', 'IndentDisable' },
  keys = {
    { '<F5>', '<Cmd>IndentToggle<CR>', desc = 'Toggle indent guides' },
  },
  opts = {},
  lazy = false,
  config = function()
    require('indentmini').setup {
      enabled = true,
    }
  end,
}
