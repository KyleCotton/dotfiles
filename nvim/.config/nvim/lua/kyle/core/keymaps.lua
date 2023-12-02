-- See `:help vim.keymap.set()`
-- Vim help for keybindings.

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the space bar in normals and visual mode so we can use it as the leader.
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- When doing half page jumps keep the cursor in the centre of the page.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Disable the arrow keys in all modes to force HJKL use.
vim.keymap.set({"", "!"}, "<Right>", "", {})
vim.keymap.set({"", "!"}, "<Left>", "", {})
vim.keymap.set({"", "!"}, "<Up>", "", {})
vim.keymap.set({"", "!"}, "<Down>", "", {})

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Bring up `netrw` with a single keybinding.
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
