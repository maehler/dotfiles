local lsp = require("lsp-zero")

lsp.preset({
    name = "minimal",
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr }
    lsp.default_keymaps(opts)
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
    vim.keymap.set({ "n", "x" }, "<leader>gf", function()
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    end, opts)
end)

local cmp = require("cmp")

local cmp_select = { behaviour = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<Tab>"] = vim.NIL,
    ["<S-Tab>"] = vim.NIL,
    ["<CR>"] = vim.NIL,
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.setup()
