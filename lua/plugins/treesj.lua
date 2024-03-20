return {
  {
    'Wansmer/treesj',
    keys = {
      { 'tn', '<cmd> TSJToggle <CR>', desc = 'toggle treesj' },
    },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup {
        use_default_keymaps = false,
      }
    end,
  },
}
