return {
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {
      ensure_installed = { 'lua_ls', 'rust_analyzer', 'pylsp' },
    },
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      {
        'neovim/nvim-lspconfig',
        config = function()
          vim.lsp.config('lua_ls', {
            settings = {
              Lua = {
                diagnostics = {
                  globals = { 'vim' },
                },
              },
            },
          })
        end,
      },
    },
  },
}
