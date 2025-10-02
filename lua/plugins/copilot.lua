---@diagnostic disable: missing-fields
return {
  {
    'zbirenbaum/copilot.lua',
    event = 'VeryLazy',
    cmd = 'Copilot',
    build = ':Copilot auth',
    keys = {
      {
        '<leader>ct',
        function()
          if require('copilot.client').is_disabled() then
            vim.cmd 'Copilot enable'
            vim.notify 'Copilot Enabled'
          else
            vim.cmd 'Copilot disable'
            vim.notify 'Copilot Disabled'
          end
        end,
        desc = '[T]oggle Copilot',
      },
    },
    ---@module 'copilot'
    ---@type CopilotConfig
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = false,
        keymap = {
          accept = '<tab>',
        },
      },
    },
    config = function(_, opts)
      require('copilot').setup(opts)
      -- Disable copilot by default
      vim.cmd 'Copilot disable'
    end,
  },
  {
    enabled = false,
    'github/copilot.vim',
    event = 'VeryLazy',
    -- Lazy loading copilot only when <leader>ct is pressed
    keys = {
      {
        '<leader>ct',
        function()
          vim.g.copilot_enabled = not vim.g.copilot_enabled
          vim.cmd 'Copilot'
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
