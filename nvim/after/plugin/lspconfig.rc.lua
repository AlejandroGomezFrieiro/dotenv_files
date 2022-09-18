local status, nvim_lsp = pcall(require, 'lspconfig')

if (not status) then return end

local protocol = require('vim.lsp.protocol')
local on_attach = function(client, bufnr)
    if client.server_capabilitier.documentFormattingProvider then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
        vim.api.nvim_command [[autogroup END]]
    end
end

local status, installer = pcall(require, 'nvim-lsp-installer')

if not status then return end

installer.setup({
    automatic_installation = true,
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
nvim_lsp.sumneko_lua.setup {}
nvim_lsp.pylsp.setup {}
