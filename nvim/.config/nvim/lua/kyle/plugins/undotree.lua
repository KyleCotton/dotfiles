return {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
    end
  }
