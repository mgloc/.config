return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      require('telescope').setup {
        defaults = {
          preview = {
            filesize_limit = 0.5555,
          },
        },
      }

      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sf', function()
        builtin.find_files {
          hidden = true,
        }
      end, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Find existing buffers' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('v', '<leader>sg', builtin.grep_string, { desc = '[S]earch [G]rep' })
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>s.', builtin.git_files, { desc = '[S]earch [.]Gitfiles' })
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
