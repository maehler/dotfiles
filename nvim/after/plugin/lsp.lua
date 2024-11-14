local lsp = require('lsp-zero')

local servers = {
  eslint = {},
  lua_ls = {},
  rust_analyzer = {},
  -- pylsp = {
  --   pylsp = {
  --     plugins = {
  --       autopep8 = { enabled = false },
  --       black = { enabled = true, line_length = 100 },
  --       flake8 = { enabled = false },
  --       pyls_isort = { enabled = true, profile = "black" },
  --       jedi_completion = { enabled = true, fuzzy = true },
  --       pycodestyle = { enabled = true, maxLineLength = 100 },
  --       pylint = { enabled = true },
  --       pylsp_mypy = { enabled = true },
  --       pyflakes = { enabled = false },
  --     },
  --   },
  -- },
  pyright = {
    pyright = {
      disableOrganizeImports = "test",
    },
    python = {
      analysis = {
        ignore = { '*' },
      },
    },
  },
  ruff = {
    init_options = {
      settings = {
        lineLength = 100,
        logLevel = "warn",
        lint = { select = {"E", "F", "W"} },
      },
    },
  },
  gopls = {
    gopls = {
      gofumpt = true,
    },
  },
  golangci_lint_ls = {},
  tailwindcss = {
    filetypes = { 'html', 'gotmpl' },
  },
  html = {
    filetypes = { 'html', 'gotmpl' },
  },
  htmx = {
    filetypes = { 'html', 'htmx', 'gotmpl' },
  },
  groovyls = {
    filetypes = { 'groovy', 'nextflow' },
    classpath = { "$JAVA_HOME/lib" },
  },
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
      trace = "messages",
      capabilities = capabilities,
      init_options = (servers[name] or {}).init_options,
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
