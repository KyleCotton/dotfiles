return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function ()
    require("nvim-treesitter.install").prefer_git = true
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 'c', 'cpp', 'lua', 'python', 'rust', 'vimdoc', 'vim', 'bash' },

      -- don't automatically install as this could break things when I'm in the
      -- middle of working
      auto_install = false,

      highlight = { enable = true },
      indent = { enable = true },
    }
  end
}
