local lsp = vim.lsp

local cmplsp_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if not cmplsp_ok then
    return
end


local on_attach = function(_, _)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, {})

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, {})
    --vim.keymap.set('n', '<leader>gu', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', '<leader>gu', vim.lsp.buf.references, {})
    vim.keymap.set('n', '<C-space>', vim.lsp.buf.hover, {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_lsp.default_capabilities(capabilities)

lsp.config('clangd', {
    on_attach = on_attach,
    capabiliters = capabilities,
    filetypes = { 'c', 'cpp' },
    cmd = { 'clangd' },
})
lsp.enable('clangd')

lsp.config['gopls'] = {
    on_attach = on_attach,
    capabiliters = capabilities,
    filetypes = { 'go' },
    cmd = { 'gopls' },
}
lsp.enable('gopls')

lsp.config['rust_analyzer'] = {
    on_attach = on_attach,
    capabiliters = capabilities,
    filetypes = { 'rust' },
    cmd = { 'rust-analyzer' },
}
lsp.enable('rust_analyzer')

lsp.config['lua_ls'] = {
    on_attach = on_attach,
    capabiliters = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            },
            workspace = {
                library = {
                    ["/home/arne/code/git/chatterino2/docs/plugin-meta.lua"] = true
                }
            },
        }
    },
    filetypes = { 'lua' },
    cmd = { 'lua-language-server' },
}
lsp.enable('lua_ls')

lsp['pylsp'] = {
    on_attach = on_attach,
    capabiliters = capabilities,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = { "E302", "W291", "W293", "E111", "E251", "E117", "E226", "E265", "E225", "E501", "E303"},
                    maxLineLength = 100
                }
            }
        }
    },
    filetypes = { 'python' },
    cmd = { 'pylsp' },
}
lsp.enable('pylsp')

lsp.config['texlab'] = {
    on_attach = on_attach,
    capabiliters = capabilities,
    filetypes = { 'tex', 'bib' },
    cmd = { 'texlab' },
}
lsp.enable('texlab')

--
-- vim.g.tex_flavor = "latex"
-- lspconfig.ltex.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     -- filetypes = { "markdown", "tex", "plaintex" }
--     filetypes = { "tex", "plaintex" }
-- }


vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = ' ',
            [vim.diagnostic.severity.INFO] = ' ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
        linehl = {
            -- [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
            [vim.diagnostic.severity.WARN] = 'WarningMsg',
        },
    },
    severity_sort = true,
})
