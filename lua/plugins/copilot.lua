return {
  {
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
  },
  {
    {
      'CopilotC-Nvim/CopilotChat.nvim',
      dependencies = {
        { 'nvim-lua/plenary.nvim', branch = 'master' },
      },
      build = 'make tiktoken',
      keys = {
        { '<leader>cc', ':CopilotChat<cr>', desc = 'Open [C]opilot [C]chat', silent = true },
      },
      opts = {
        -- See Configuration section for options
      },
    },
  },
}
