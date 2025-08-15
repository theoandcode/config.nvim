return {
  'github/copilot.vim',
  -- Lazy loading copilot only when <leader>ct is pressed
  keys = {
    {
      '<leader>ct',
      function()
        vim.g.copilot_enabled = not vim.g.copilot_enabled
        if vim.g.copilot_enabled then
          print 'Copilot enabled'
        else
          print 'Copilot disabled'
        end
      end,
      desc = '[T]oggle Copilot',
    },
  },
  init = function()
    vim.g.copilot_enabled = false
  end,
}
