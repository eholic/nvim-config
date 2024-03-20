return {
  -- Comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {
        mappings = {
          basic = false,
          extra = false,
        },
      }
      -- toggle comment
      vim.keymap.set('n', ',c<Space>', require('Comment.api').toggle.linewise.current, { desc = 'toggle comment' })
      vim.keymap.set('v', ',c<Space>', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = 'toggle comment' })
    end,
  },
}
