-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history to a file.
vim.o.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Add a visual ruler at 80 and 120 characters from the start of the line.
vim.o.colorcolumn = "80,120"

-- Enable US spelling support
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- Use the first suggested correction for a spelling mistake.
vim.keymap.set('n', '<leader>c', "z=1<CR><CR>", { desc = '[C]orrect Spelling' })

-- Have no less than 8 lines to the end of the screen from the cursor position.
vim.opt.scrolloff = 8

-- With `netrw` replace the window don't do splits or anything.
vim.g.netrw_browse_split = 0

-- Disable the `netrw` banner.
-- vim.g.netrw_banner = 0

-- Make new splits take up 25% of the available space.
vim.g.netrw_winsize = 25

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

