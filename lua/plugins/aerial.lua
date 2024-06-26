return {
  {
    'stevearc/aerial.nvim',
    keys = {
      { ',a', '<cmd>AerialToggle!<CR>', desc = ',[A]erial' },
    },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('aerial').setup {
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set('n', '<C-p>', '<cmd>AerialPrev<CR>', { buffer = bufnr })
          vim.keymap.set('n', '<C-n>', '<cmd>AerialNext<CR>', { buffer = bufnr })
        end,
      }
    end,
  },
}
