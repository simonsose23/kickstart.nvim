return {
  'stevearc/aerial.nvim',
  opts = {
    nerd_font = true,
  },
  -- Optional dependencies
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },

  vim.keymap.set('n', '<leader>go', '<cmd>AerialOpen<cr>', { desc = 'Goto Outline' }),
  vim.keymap.set('n', '<leader>to', '<cmd>AerialToggle<cr>', { desc = 'Toggle Outline' }),
}
