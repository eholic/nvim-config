return {
  {
    'sindrets/diffview.nvim',
    keys = {
      { ',dv', '<cmd>DiffviewOpen<CR>', desc = ',[D]iff[V]iew' },
      { ',dh', '<cmd>DiffviewFileHistory<CR>', desc = ',[D]iffviewFile[H]istory' },
    },
    config = function()
      require('diffview').setup {
        keymaps = {
          file_panel = {
            { 'n', 'q', '<cmd>DiffviewClose<CR>', { desc = 'close diffview' } },
          },
          file_history_panel = {
            { 'n', 'q', '<cmd>DiffviewClose<CR>', { desc = 'close diffview' } },
          },
        },
      }
    end,
  },
}
