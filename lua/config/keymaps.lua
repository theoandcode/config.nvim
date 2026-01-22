-- Center cursor after half screen jumps
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Go half screen down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Go half screen up' })
-- move code around
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { silent = true, desc = 'Move selected line(s) down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { silent = true, desc = 'Move selected line(s) up' })
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { silent = true, desc = 'Move code down' })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { silent = true, desc = 'Move code up' })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Diagnostic location list
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- Escape terminal mode
vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>')
vim.keymap.set('n', '<leader>w', function()
  local bufnr = vim.api.nvim_get_current_buf()
  -- Try to go to next buffer, or previous if next doesn't exist
  local next = vim.fn.bufnr '#'
  if next == -1 or not vim.api.nvim_buf_is_loaded(next) then
    vim.cmd 'bnext'
  else
    vim.cmd 'buffer #'
  end
  vim.cmd('bd ' .. bufnr)
end, { desc = 'Close current buffer without closing window' })
vim.keymap.set('n', '<leader>n', ':bn<CR>', { desc = 'Go to [N]ext buffer' })
vim.keymap.set('n', '<leader>p', ':bp<CR>', { desc = 'Go to [P]revious buffer' })
