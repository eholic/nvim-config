return {
  {
    'kylechui/nvim-surround',
    version = 'v3', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {
        keymaps = {
          insert = false,
          insert_line = false,
          normal = 's',
          normal_cur = false,
          normal_line = false,
          normal_cur_line = false,
          visual = 's',
          visual_line = false,
          delete = 'ds',
          change = 'cs',
        },
        aliases = {
          ['a'] = '>',
          ['b'] = ')',
          ['B'] = '}',
          ['r'] = ']',
          ['s'] = "'",
          ['d'] = '"',
        },
      }
    end,
  },
}
