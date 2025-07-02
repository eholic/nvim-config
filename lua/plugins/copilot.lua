return {
  {
    'github/copilot.vim',
    cmd = 'Copilot',
    config = function()
      vim.keymap.set('i', '<TAB><TAB>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })
      vim.g.copilot_no_tab_map = true
    end,
  },
}
