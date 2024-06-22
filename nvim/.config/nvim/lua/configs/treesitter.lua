local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
    return
end

treesitter.setup {
    ensure_installed = {
        'c', 'python', 'lua', 'cpp'
    },
    highlight = {
        enable = true,
    },
    indent = {
        true,
        disabled = { "python" },
    }
}

-- <============ Treesitter Context ============>
ok, ts_context = pcall(require, 'treesitter-context')
if not ok then
    return
end

ts_context.setup {
    separator = '',
    max_lines=7,
}
