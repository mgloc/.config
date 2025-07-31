return {
  'supermaven-inc/supermaven-nvim',
  config = function()
    require('supermaven-nvim').setup {}
    local api = require 'supermaven-nvim.api'
    vim.keymap.set('n', '<Leader>ts', function()
      api.toggle()
      print('Supermaven ' .. (api.is_running() and 'ON' or 'OFF'))
    end, { desc = '[T]oggle [S]upermaven' })
  end,
}
