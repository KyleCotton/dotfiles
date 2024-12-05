-- Fuzzy Finder (files, lsp, etc)
return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- NOTE: If you are having trouble with this installation,
      --       refer to the README for telescope-fzf-native for more instructions.
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    -- Use telescope for the standard vim ui selection.
    'nvim-telescope/telescope-ui-select.nvim'
  },
  config = function()
    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    local telescope = require('telescope')

    local ignore_patterns = {".git", ".venv"}

    telescope.setup {
      pickers = {
        live_grep = {
          file_ignore_patterns = ignore_patterns,
          additional_args = function(_)
            return {"--hidden"}
          end,
        },
        find_files = {
          file_ignore_patterns = ignore_patterns,
          hidden = true,
        },
      },
    }

    telescope.load_extension('ui-select')

    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')

    local bt = require('telescope.builtin')

    vim.keymap.set('n', '<leader>/', bt.current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer' })
    vim.keymap.set('n', '<leader>fb', bt.buffers, { desc = '[F]ind [B]uffers' })
    vim.keymap.set('n', '<leader>fg', bt.git_files, { desc = '[F]ind [G]it Files' })
    vim.keymap.set('n', '<leader>ff', bt.find_files, { desc = '[F]ind [F]iles' })
    vim.keymap.set('n', '<leader>ld', bt.diagnostics, { desc = '[L]SP [D]iagnostics' })
    vim.keymap.set('n', '<leader>sH', bt.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sg', bt.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sr', bt.resume, { desc = '[S]earch [R]esume' })
  end
}
