return {
  {
    'monaqa/dial.nvim',
    keys = {
      { '<C-a>', mode = { 'n', 'v' }, desc = 'dial increment' },
      { '<C-x>', mode = { 'n', 'v' }, desc = 'dial decrement' },
      { 'g<C-a>', mode = { 'n', 'v' }, desc = 'g dial increment' },
      { 'g<C-x>', mode = { 'n', 'v' }, desc = 'g dial decrement' },
    },
    config = function()
      local augend = require 'dial.augend'
      require('dial.config').augends:register_group {
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.new {
            pattern = '%Y/%m/%d',
            default_kind = 'day',
          },
          augend.date.new {
            pattern = '%Y-%m-%d',
            default_kind = 'day',
          },
          augend.date.new {
            pattern = '%m/%d',
            default_kind = 'day',
            only_valid = true,
          },
          augend.date.new {
            pattern = '%H:%M',
            default_kind = 'day',
            only_valid = true,
          },
          augend.constant.alias.ja_weekday,
          augend.constant.alias.ja_weekday_full,
          augend.constant.new { elements = { 'true', 'false' }, preserve_case = true },
          augend.misc.alias.markdown_header,
        },
      }

      vim.keymap.set('n', '<C-a>', function()
        require('dial.map').manipulate('increment', 'normal')
      end, { desc = 'dial/increment' })
      vim.keymap.set('n', '<C-x>', function()
        require('dial.map').manipulate('decrement', 'normal')
      end, { desc = 'dial/decrement' })
      vim.keymap.set('n', 'g<C-a>', function()
        require('dial.map').manipulate('increment', 'gnormal')
      end, { desc = 'dial/gincrement' })
      vim.keymap.set('n', 'g<C-x>', function()
        require('dial.map').manipulate('decrement', 'gnormal')
      end, { desc = 'dial/gdecrement' })

      vim.keymap.set('v', '<C-a>', function()
        require('dial.map').manipulate('increment', 'visual')
      end, { desc = 'dial/vincrement' })
      vim.keymap.set('v', '<C-x>', function()
        require('dial.map').manipulate('decrement', 'visual')
      end, { desc = 'dial/vdecrement' })
      vim.keymap.set('v', 'g<C-a>', function()
        require('dial.map').manipulate('increment', 'gvisual')
      end, { desc = 'dial/gvincrement' })
      vim.keymap.set('v', 'g<C-x>', function()
        require('dial.map').manipulate('decrement', 'gvisual')
      end, { desc = 'dial/gvdecrement' })
    end,
  },
}
