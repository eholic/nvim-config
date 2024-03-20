return {
  {
    'phaazon/hop.nvim',
    keys = { { ';;', '<cmd> HopChar1 <CR>', mode = '', desc = 'hop word' } },
    config = function()
      require('hop').setup {}
    end,
  },
}
