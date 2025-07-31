return {
  {
    'vuciv/golf',
    cmd = { 'Golf' },
  },
  {
    'nvzone/typr',
    dependencies = 'nvzone/volt',
    opts = {},
    cmd = { 'Typr', 'TyprStats' },
  },
  {
    'eandrju/cellular-automaton.nvim',
    keys = {
      {
        '<leader>fmlr',
        function()
          require('cellular-automaton').start_animation 'make_it_rain'
        end,
        mode = { 'n' },
        desc = '[R]ain',
      },
      {
        '<leader>fmll',
        function()
          require('cellular-automaton').start_animation 'game_of_life'
        end,
        mode = { 'n' },
        desc = '[L]ife',
      },
      {
        '<leader>fmls',
        function()
          require('cellular-automaton').start_animation 'scramble'
        end,
        mode = { 'n' },
        desc = '[S]cramble',
      },
    },
  },
}
