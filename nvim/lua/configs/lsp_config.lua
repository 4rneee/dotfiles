local m_ok, mason = pcall(require, "mason")
if not m_ok then
    return
end

local mlsp_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mlsp_ok then
    return
end

local lspc_ok, lspconfig = pcall(require, "lspconfig")
if not lspc_ok then
    return
end

local cmplsp_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if not cmplsp_ok then
    return
end

mason.setup()

mason_lspconfig.setup({
    ensure_installed = { "lua_ls", "clangd" }
})


local on_attach = function(_, _)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, {})

    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', '<leader>gu', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', '<C-space>', vim.lsp.buf.hover, {})
end

local capabilities = cmp_lsp.default_capabilities()

lspconfig.clangd.setup {
    on_attach = on_attach,
    capabiliters = capabilities,
}

lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabiliters = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim', 'c2' }
            }
        }
    }
}

lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    capabiliters = capabilities,
}

lspconfig.pylsp.setup {
    on_attach = on_attach,
    capabiliters = capabilities,
}

lspconfig.jdtls.setup {
    on_attach = on_attach,
    capabiliters = capabilities,
}

lspconfig.gopls.setup {
    on_attach = on_attach,
    capabiliters = capabilities,
}

lspconfig.texlab.setup {
    on_attach = on_attach,
    capabiliters = capabilities,
}

lspconfig.cmake.setup {
    on_attach = on_attach,
    capabiliters = capabilities,
}

lspconfig.asm_lsp.setup {
    on_attach = on_attach,
    capabiliters = capabilities,
}


local signs = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " "
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

