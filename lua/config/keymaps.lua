-- Center cursor after half screen jumps
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Go half screen down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Go half screen up' })
-- move code around
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { silent = true, desc = 'Move selected line(s) down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { silent = true, desc = 'Move selected line(s) up' })
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { silent = true, desc = 'Move code down' })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { silent = true, desc = 'Move code up' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
