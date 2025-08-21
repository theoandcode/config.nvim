return {
  {
    'github/copilot.vim',
    -- Lazy loading copilot only when <leader>ct is pressed
    keys = {
      {
        '<leader>ct',
        function()
          if not package.loaded.copilot then
            vim.cmd 'Copilot'
          end
          vim.g.copilot_enabled = not vim.g.copilot_enabled
          if vim.g.copilot_enabled then
            vim.cmd 'Copilot enable'
            print 'Copilot enabled'
          else
            vim.cmd 'Copilot disable'
            print 'Copilot disabled'
          end
        end,
        desc = '[T]oggle Copilot',
      },
    },
    init = function()
      vim.g.copilot_enabled = false
    end,
  },
  {
    {
      'CopilotC-Nvim/CopilotChat.nvim',
      dependencies = {
        { 'nvim-lua/plenary.nvim', branch = 'master' },
      },
      build = 'make tiktoken',
      keys = {
        { '<leader>cc', ':CopilotChat<cr>', desc = 'Open [C]opilot [C]chat', silent = true, mode = { 'n', 'v' } },
      },
      opts = { auto_insert_mode = true },
    },
  },
}
