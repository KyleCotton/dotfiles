local diffview_toggle = function()
  local diffview = require('diffview')
  local current_diffview = next(require('diffview.lib').views)
  if current_diffview == nil then
    -- Not open so open it.
    diffview.open()
  else
    -- Open so close it.
    diffview.close()
  end
end

return {
  "sindrets/diffview.nvim",
  config = function()
    require('diffview').setup {
      use_icons = false,

      -- When resolving merge conflicts use the horizontal view.
      view = { 
        merge_tool = {
          layout = "diff3_mixed"
        }
      }
    }

    vim.keymap.set('n', '<leader>gd', diffview_toggle, { desc = 'Git [D]iff toggle' })

    local set = vim.opt 
    set.fillchars = set.fillchars + 'diff:╱'
  end
}
