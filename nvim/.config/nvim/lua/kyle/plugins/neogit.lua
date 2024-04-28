return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim", -- optional
    "ibhagwan/fzf-lua",              -- optional
  },
  config = function()
    local neogit = require('neogit')
    neogit.setup {
      mappings = {
        rebase_editor = {
          ["<c-p>"] = "MoveUp",
          ["<c-n>"] = "MoveDown",
        }
      }
    }
    vim.keymap.set('n', '<leader>gg', neogit.open, { desc = '[G]it Open Neogit' })
    vim.keymap.set('n', '<leader>gc', neogit.action("commit", "commit", { '--verbose' }), { desc = 'Git [C]ommit' })
  end,
}
