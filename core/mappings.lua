-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Toggle Comment
vim.keymap.set('n', '<C-_>', ':normal gcc<CR>', { desc = 'toggle comment' })
vim.keymap.set('v', '<C-_>', '<Esc>:normal gvgc<CR>', { desc = 'toggle comment' })
vim.keymap.set('n', '<C-/>', ':normal gcc<CR>', { desc = 'toggle comment' })
vim.keymap.set('v', '<C-/>', '<Esc>:normal gvgc<CR>', { desc = 'toggle comment' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Toggle wrap/nowrap
vim.keymap.set('n', 'tw', '<cmd> set wrap!<CR>', { desc = 'toggle wrap' })

-- Help window
vim.keymap.set('n', '<C-h>', ':<C-u>help<Space>', { desc = 'help' })

-- Move cursor
--   Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
--   http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
vim.keymap.set('n', 'j', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true, desc = 'Move down' })
vim.keymap.set('n', 'k', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true, desc = 'Move up' })

vim.keymap.set('i', '<C-b>', '<Left>', { desc = 'Move left' })
vim.keymap.set('i', '<C-f>', '<Right>', { desc = 'Move right' })
vim.keymap.set('i', '<C-n>', '<Down>', { desc = 'Move down' })
vim.keymap.set('i', '<C-p>', '<Up>', { desc = 'Move up' })

-- Tab
vim.keymap.set('n', 'tt', '<cmd>tabnew<CR>', { desc = 'open new tab' })
vim.keymap.set('n', 't1', '<cmd>tabn 1<CR>', { desc = 'open tab 1' })
vim.keymap.set('n', 't2', '<cmd>tabn 2<CR>', { desc = 'open tab 2' })
vim.keymap.set('n', 't3', '<cmd>tabn 3<CR>', { desc = 'open tab 3' })
vim.keymap.set('n', 't4', '<cmd>tabn 4<CR>', { desc = 'open tab 4' })
vim.keymap.set('n', 't5', '<cmd>tabn 5<CR>', { desc = 'open tab 5' })

-- Text-object
vim.keymap.set('v', 'aa', 'a>', { desc = 'angle' })
vim.keymap.set('v', 'ia', 'i>', { desc = 'angle' })
vim.keymap.set('v', 'ar', 'a]', { desc = 'rectangle' })
vim.keymap.set('v', 'ir', 'i]', { desc = 'rectangle' })
vim.keymap.set('v', 'as', "a'", { desc = 'single quotation' })
vim.keymap.set('v', 'is', "i'", { desc = 'single quotation' })
vim.keymap.set('v', 'ad', 'a"', { desc = 'double quotation' })
vim.keymap.set('v', 'id', 'i"', { desc = 'double quotation' })

vim.keymap.set('o', 'aa', 'a>', { desc = 'angle' })
vim.keymap.set('o', 'ia', 'i>', { desc = 'angle' })
vim.keymap.set('o', 'ar', 'a]', { desc = 'rectangle' })
vim.keymap.set('o', 'ir', 'i]', { desc = 'rectangle' })
vim.keymap.set('o', 'as', "a'", { desc = 'single quotation' })
vim.keymap.set('o', 'is', "i'", { desc = 'single quotation' })
vim.keymap.set('o', 'ad', 'a"', { desc = 'double quotation' })
vim.keymap.set('o', 'id', 'i"', { desc = 'double quotation' })
