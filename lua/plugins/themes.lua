return {
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    -- enabled = false,
    config = function(_, opts)
      require('tokyonight').setup(opts)
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
  {
    'catppuccin/nvim',
    priority = 1000,
    enabled = false,
    config = function()
      require('catppuccin').setup()
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
