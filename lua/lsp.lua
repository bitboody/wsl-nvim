-- Initialize mason and ensure Mason-related plugins are loaded
require('mason').setup()

-- Configure mason-lspconfig to automatically install the desired LSP servers
require('mason-lspconfig').setup {
    ensure_installed = {
        'ts_ls',     -- JavaScript/TypeScript
        'clangd',       -- C/C++
        'html',         -- HTML
        'cssls',        -- CSS
        'asm_lsp',      -- Assembly (optional)
    },
}

-- Load nvim-lspconfig plugin
local lspconfig = require('lspconfig')

-- Define the list of LSP servers
local servers = { 'ts_ls', 'clangd', 'html', 'cssls', 'asm_lsp' }

-- Setup each LSP server with default settings
for _, server in ipairs(servers) do
  lspconfig[server].setup {}
end
