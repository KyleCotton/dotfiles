--  This function gets run when an LSP connects to a particular buffer.
local on_lsp_attach = function(_, bufnr)
  -- LSP Operations
  vim.keymap.set("n", '<leader>lr', vim.lsp.buf.rename, { desc = '[L]SP [R]ename' })
  vim.keymap.set("n", '<leader>la', vim.lsp.buf.code_action, { desc = '[L]SP Code [A]ction' })

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

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

local config = function()
  require('mason').setup()
  require('mason-lspconfig').setup()

  local servers = {
    clangd = {},
    pyright = {},
    rust_analyzer = {},
    cmake = {},
    lua_ls = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
  }

  -- Setup neovim lua configuration
  require('neodev').setup()

  -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

  -- Ensure the servers above are installed
  local mason_lspconfig = require 'mason-lspconfig'

  mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
  }

  mason_lspconfig.setup_handlers {
    function(server_name)
      require('lspconfig')[server_name].setup {
        capabilities = capabilities,
        on_attach = on_lsp_attach,
        settings = servers[server_name],
        filetypes = (servers[server_name] or {}).filetypes,
      }
    end,
  }
end

return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = config,
}
