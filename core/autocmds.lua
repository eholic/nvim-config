-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Auto ditect root directory
--   Array of file names indicating root directory. Modify to your liking.
local root_names = { '.git', 'Makefile', '_darcs', '.hg', '.bzr', '.svn', 'node_modules', 'CMakeLists.txt', '.stylua.toml', 'README.md' }
--   Cache to use for speed up (at cost of possibly outdated results)
local root_cache = {}

local set_root = function()
  -- Get directory path to start search from
  local path = vim.api.nvim_buf_get_name(0)
  if path == '' then
    return
  end
  path = vim.fs.dirname(path)

  -- Try cache and resort to searching upward for root directory
  local root = root_cache[path]
  if root == nil then
    local root_file = vim.fs.find(root_names, { path = path, upward = true })[1]
    if root_file == nil then
      return
    end
    root = vim.fs.dirname(root_file)
    root_cache[path] = root
  end

  -- Set current directory
  vim.fn.chdir(root)
end

local root_augroup = vim.api.nvim_create_augroup('MyAutoRoot', {})
vim.api.nvim_create_autocmd('BufEnter', { group = root_augroup, callback = set_root })

-- Show Zenkaku space (i.e. 　　　　)
vim.api.nvim_create_augroup('extra-whitespace', {})
vim.api.nvim_create_autocmd({ 'VimEnter', 'WinEnter' }, {
  group = 'extra-whitespace',
  pattern = { '*' },
  command = [[call matchadd('ExtraWhitespace', '[\u200B\u3000]')]],
})
vim.api.nvim_create_autocmd({ 'ColorScheme' }, {
  group = 'extra-whitespace',
  pattern = { '*' },
  command = [[highlight default ExtraWhitespace ctermbg=202 ctermfg=202 guibg=DarkMagenta]],
})

-- help
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'help',
  callback = function(event)
    vim.keymap.set('n', 'q', ':q<CR>', { buffer = event.buf })
  end,
})
