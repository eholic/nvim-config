return {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- Highlight color code
  { 'norcalli/nvim-colorizer.lua', opts = {} },

  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    dependencies = { 'petertriho/nvim-scrollbar' },
    config = function()
      require('gitsigns').setup()
      require('scrollbar').setup()
      require('scrollbar.handlers.gitsigns').setup()
    end,
  },

  { -- You can easily change to a different colorscheme.
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    init = function()
      -- Load the colorscheme here.
      vim.cmd.colorscheme 'tokyonight-moon'

      -- You can configure highlights by doing something like
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'tiagovla/scope.nvim' },
    config = function()
      require('bufferline').setup {
        options = { show_buffer_close_icons = false },
      }
      require('scope').setup {}
      vim.keymap.set('n', '<Tab>', '<cmd> BufferLineCycleNext <CR>', { desc = 'bufferline cycle next' })
      vim.keymap.set('n', '<S-Tab>', '<cmd> BufferLineCyclePrev <CR>', { desc = 'bufferline cycle next' })
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = 'horizon',
        section_separators = { left = '', right = '' },
      },
    },
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      indent = { char = '│' },
      scope = { char = '│' },
    },
  },
  {
    'utilyre/barbecue.nvim',
    dependencies = {
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {},
  },
}
