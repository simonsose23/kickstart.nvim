return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('codecompanion').setup {
      adapters = {
        http = {
          localllm = function()
            local adapter = require('codecompanion.adapters.http').extend('openai_compatible', {
              env = {
                url = 'http://localhost:1234',
              },
              schema = {
                model = {
                  default = 'mistralai/devstral-small-2-2512',
                  choices = {
                    'devstral-small-2505-mlx',
                    'mistralai/devstral-small-2-2512',
                  },
                },
              },
            })

            return adapter
          end,
        },
      },
      interactions = {
        inline = {
          keymaps = {
            accept_change = {
              modes = { n = 'ga' },
              description = 'Accept the suggested change',
            },
            reject_change = {
              modes = { n = 'gr' },
              opts = { nowait = true },
              description = 'Reject the suggested change',
            },
          },
          adapter = {
            name = 'localllm',
            model = 'mistralai/devstral-small-2-2512',
          },
        },
        chat = {
          adapter = 'localllm',
        },
      },
      display = {
        inline = {
          layout = 'vertical',
        },
      },
    }
  end,

  -- note to self about the inline mode: when in normal mode, the ai will just append at the cursor position.
  -- when in visual mode, the selected part can be modified

  -- Optional keybindings
  vim.keymap.set({ 'n', 'v' }, '<leader>a', '', { desc = 'AI' }),
  vim.keymap.set('n', '<leader>ac', '<cmd>CodeCompanionChat Toggle<cr>', { desc = 'Open CodeCompanion Chat' }),
  vim.keymap.set({ 'n', 'v' }, '<leader>ai', '<cmd>CodeCompanion<cr>', { desc = 'Inline CodeCompanion' }),
  vim.keymap.set('n', '<leader>aa', '<cmd>CodeCompanionActions<cr>', { desc = 'CodeCompanion Actions' }),
}
