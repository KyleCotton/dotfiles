-- Useful plugin to show you pending keybinds.
return {
  'folke/which-key.nvim',
  opts = {
    spec = {
      { '<leader>g', group = '[G]it' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>f', group = '[F]ind' },
      { '<leader>l', group = '[L]SP' },
      { '<leader>lw', group = '[L]SP [W]orkspace' },
      { '<leader>h', group = '[H]arpoon' },
    }
  },
}
