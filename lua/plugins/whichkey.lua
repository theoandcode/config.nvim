return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  opts = {
    delay = 0,
    icons = {
      mappings = true,
    },

    -- Document existing key chains
    spec = {
      { '<leader>f', group = '[F]ind' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      { '<leader>c', group = '[C]opilot' },
      { '<leader>ct', desc = '[T]oggle On/Off' },
    },
  },
}
