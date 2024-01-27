--  This function gets run when an LSP connects to a particular buffer.
local on_lsp_attach = function(args)
  -- LSP Operations
  vim.keymap.set("n", '<leader>lr', vim.lsp.buf.rename, { desc = '[L]SP [R]ename' })
  vim.keymap.set("n", '<leader>la', vim.lsp.buf.code_action, { desc = '[L]SP Code [A]ction' })
  vim.keymap.set("n", '<leader>lf', vim.lsp.buf.format, { desc = '[L]SP [F]ormat' })

  -- LSP Workspace keymaps
  vim.keymap.set("n", '<leader>lwa', vim.lsp.buf.add_workspace_folder, { desc = '[L]SP [W]orkspace [A]dd Folder' })
  vim.keymap.set("n", '<leader>lwr', vim.lsp.buf.remove_workspace_folder, { desc = '[L]SP [W]orkspace [R]emove Folder' })
  vim.keymap.set("n", '<leader>lwl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { desc = '[L]SP [W]orkspace [L]ist Folders' })
  vim.keymap.set("n", 'gd', require('telescope.builtin').lsp_definitions, { desc = '[G]oto [D]efinition' })
  vim.keymap.set("n", 'gr', require('telescope.builtin').lsp_references, { desc = '[G]oto [R]eferences' })
  vim.keymap.set("n", 'gI', require('telescope.builtin').lsp_implementations, { desc = '[G]oto [I]mplementation' })
  vim.keymap.set("n", 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })
  vim.keymap.set("n", 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
  vim.keymap.set("i", '<C-h>', vim.lsp.buf.signature_help, { desc = 'Signature Documentation' })

  -- Diagnostic keymaps
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
  vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float,
    { desc = '[L]SP Open floating diagnostic [E]rror message' })
end

local config = function()
  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = on_lsp_attach,
  })

  -- Initialize each of the LSP servers.
  local lspconfig = require('lspconfig')
  lspconfig.pyright.setup{}
  lspconfig.rust_analyzer.setup{}
  lspconfig.clangd.setup{}
end


return {
  'neovim/nvim-lspconfig',
  config = config,
  dependencies = {
    -- Useful status updates for LSP to see indexing, loading, etc.
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', opts = {} },
  },
}

