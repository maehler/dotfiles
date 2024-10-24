local lsp = require('lsp-zero')

local servers = {
  eslint = {},
  lua_ls = {},
  rust_analyzer = {},
  pylsp = {
    pylsp = {
      plugins = {
        autopep8 = { enabled = false },
        black = { enabled = true, line_length = 100 },
        flake8 = { enabled = false },
        pyls_isort = { enabled = true, profile = "black" },
        jedi_completion = { fuzzy = true },
        pycodestyle = { enabled = true, maxLineLength = 100 },
        pylint = { enabled = false },
        pylsp_mypy = { enabled = false },
        pyflakes = { enabled = false },
      },
    },
  },
  gopls = {},
  tailwindcss = {
    filetypes = { 'html', 'gotmpl' },
  },
  html = {
    filetypes = { 'html', 'gotmpl' },
  },
  htmx = {
    filetypes = { 'html', 'htmx', 'gotmpl' },
  }
}

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = vim.tbl_keys(servers),
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('mason-lspconfig').setup_handlers({
  function(name)
    require('lspconfig')[name].setup({
      capabilities = capabilities,
      settings = servers[name],
      filetypes = (servers[name] or {}).filetypes,
    })
  end
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
  vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
  vim.keymap.set('n', 'go', function() vim.lsp.buf.type_definition() end, opts)
  vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
  vim.keymap.set('n', 'gs', function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set('n', '<leader>fm', function() vim.lsp.buf.format({ async = true }) end, opts)
  vim.keymap.set('n', '<F4>', function() vim.lsp.buf.code_action() end, opts)
end)

lsp.setup()
