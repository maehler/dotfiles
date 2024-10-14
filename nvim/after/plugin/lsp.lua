local lsp = require('lsp-zero')

local servers = {
  eslint = {},
  lua_ls = {},
  rust_analyzer = {},
  pyright = {},
  gopls = {},
  tailwindcss = {
    filetypes = {'html', 'template'},
  },
}

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
-- local lspconfig_defaults = require('lspconfig').util.default_config
-- lspconfig_defaults.capabilities = vim.tbl_deep_extend(
--   'force',
--   lspconfig_defaults.capabilities,
--   require('cmp_nvim_lsp').default_capabilities()
-- )

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', 'rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = vim.tbl_keys(servers),
  -- handlers = {
  --   function(name)
  --     require('lspconfig')[name].setup({})
  --   end
  -- },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('mason-lspconfig').setup_handlers({
  function(name)
    require('lspconfig')[name].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[name],
      filetypes = (servers[name] or {}).filetypes,
    })
  end
})
