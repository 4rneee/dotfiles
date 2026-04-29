local ok, treesitter = pcall(require, 'tree-sitter-manager')
if not ok then
    return
end

treesitter.setup ({
    highlight = true,
    -- {
    --     enable = true,
    -- },
    -- indent = {
    --     true,
    --     disabled = { "python" },
    -- }
     ensure_installed = {
         "c",
         "cpp",
         "rust",
     },
})

-- <============ Treesitter Context ============>
local ok2, ts_context = pcall(require, 'treesitter-context')
if not ok2 then
    return
end

ts_context.setup {
    separator = '',
    max_lines=7,
}
