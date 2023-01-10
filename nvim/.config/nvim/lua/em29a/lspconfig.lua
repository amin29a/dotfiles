local keymaps = require("em29a.AllKeymaps")
keymaps.diagnostic()
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    keymaps.lsp(bufnr)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 50,
}
-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig')['pyright'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
        ["rust-analyzer"] = {}
    }
}
require('lspconfig')["sumneko_lua"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}
--Enable (broadcasting) snippet capability for completion
--local capabilities2 = vim.lsp.protocol.make_client_capabilities()
--capabilities2.textDocument.completion.completionItem.snippetSupport = true

require 'lspconfig'.html.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}
--vim.api.nvim_create_autocmd('FileType', {
--  pattern = 'sh',
--  callback = function()
--    vim.lsp.start({
--      name = 'bash-language-server',
--      cmd = { 'bash-language-server', 'start' },
--    })
--  end,
--})
require 'lspconfig'.bashls.setup {}
