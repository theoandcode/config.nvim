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
  },
  {
    'folke/sidekick.nvim',
    event = 'VeryLazy',
    init = function()
      vim.g.sidekick_nes = false
    end,
    ---@module 'sidekick'
    ---@type sidekick.Config
    opts = {
      -- add any options here
      cli = {
        mux = {
          backend = 'tmux',
          enabled = true,
        },
      },
    },
    -- stylua: ignore
    keys = {
      {
        "<tab>",
        function()
          -- if there is a next edit, jump to it, otherwise apply it if any
          if not require("sidekick").nes_jump_or_apply() then
            return "<Tab>" -- fallback to normal tab
          end
        end,
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
      {
        "<leader>aa",
        function() require("sidekick.cli").toggle() end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>as",
        function() require("sidekick.cli").select() end,
        -- Or to select only installed tools:
        -- require("sidekick.cli").select({ filter = { installed = true } })
        desc = "Select CLI",
      },
      {
        "<leader>at",
        function() require("sidekick.cli").send({ msg = "{this}" }) end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>av",
        function() require("sidekick.cli").send({ msg = "{selection}" }) end,
        mode = { "x" },
        desc = "Send Visual Selection",
      },
      {
        "<leader>ap",
        function() require("sidekick.cli").prompt() end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
      {
        "<c-.>",
        function() require("sidekick.cli").focus() end,
        mode = { "n", "x", "i", "t" },
        desc = "Sidekick Switch Focus",
      },
      {
        "<leader>an",
        function()
          if vim.g.sidekick_nes == nil then
            vim.g.sidekick_nes = false
          else
            vim.g.sidekick_nes = not vim.g.sidekick_nes
          end
        end,
        desc = "Toggle Next Edit Suggestions",
      }
    },
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
