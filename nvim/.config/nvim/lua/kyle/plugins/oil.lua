return {
  'stevearc/oil.nvim',
  opts = {},
  config = function()
    require("oil").setup({
      columns = {
        "permissions",
        "size",
        "mtime",
      },
      view_options = {
        show_hidden = true,
        -- Don't show the `../` file in the directory listing.
        is_always_hidden = function(name, _)
          return vim.startswith(name, "..")
        end,
      }
    })
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory with Oil" })
  end
}
