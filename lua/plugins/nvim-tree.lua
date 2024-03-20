return {
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    keys = {
      { ',t', '<cmd> NvimTreeToggle <CR>', desc = ',[N]vimtree' },
    },
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local function my_on_attach(bufnr)
        local api = require 'nvim-tree.api'

        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
        vim.keymap.set('n', '<Space>', api.node.open.edit, opts 'Open')
        vim.keymap.set('n', '?', api.tree.toggle_help, opts 'Help')
      end

      require('nvim-tree').setup {
        on_attach = my_on_attach,
        actions = { open_file = { quit_on_open = true } },
        renderer = { icons = { glyphs = { git = { untracked = '?' } } } },
        update_focused_file = {
          enable = true,
        },
      }
    end,
  },
}
