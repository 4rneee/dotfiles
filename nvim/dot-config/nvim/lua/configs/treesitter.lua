local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
    return
end

treesitter.setup {
    highlight = {
        enable = true,
    },
    indent = {
        true,
        disabled = { "python" },
    }
}

-- <============ Treesitter Context ============>
local ok2, ts_context = pcall(require, 'treesitter-context')
if not ok2 then
    return
end

ts_context.setup {
    separator = '',
    max_lines=7,
}
