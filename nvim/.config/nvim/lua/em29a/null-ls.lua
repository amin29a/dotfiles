-- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
local ok, null_ls = pcall(require, "null-ls")
if not ok then
    print('error loading null-ls.lua')
    return
end


-- code action sources
local code_actions = null_ls.builtins.code_actions

-- diagnostic sources
local diagnostics = null_ls.builtins.diagnostics

-- formatting sources
local formatting = null_ls.builtins.formatting

-- hover sources
local hover = null_ls.builtins.hover

-- completion sources
local completion = null_ls.builtins.completion


-- register any number of sources simultaneously
local sources = {
    formatting.rustfmt,
    formatting.prettier,
    --formatting.stylua,

    --code_actions.gitsigns,
    code_actions.ltrs, --rust

    diagnostics.ltrs,
    -- diagnostics.eslint,
    diagnostics.write_good,

    completion.spell,
}

null_ls.setup({ sources = sources })
