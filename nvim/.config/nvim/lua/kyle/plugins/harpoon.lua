return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup {
      -- settings = {
      --   save_on_toggle = true,
      --   sync_on_ui_close = true,
      -- },
    }

    vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Open [H]arpoon"})
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = '[H]arpoon [A]dd' })
    vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = '[H]arpooned [1]' })
    vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = '[H]arpooned [2]' })
    vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = '[H]arpooned [3]' })
    vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = '[H]arpooned [4]' })
    vim.keymap.set("n", "<leader>h5", function() harpoon:list():select(5) end, { desc = '[H]arpooned [5]' })
  end,
}
