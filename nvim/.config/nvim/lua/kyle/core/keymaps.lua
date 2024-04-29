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

-- Bring up `netrw` with a single keybinding.
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Reload buffers from disk and save all.
local reload_and_save = function()
   vim.cmd("checktime")
   vim.cmd("wa")
end
vim.keymap.set('n', '<leader>r', reload_and_save, { desc = '[R]eload and save buffers' })
