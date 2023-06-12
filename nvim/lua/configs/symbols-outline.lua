local ok, symbols_outline = pcall(require, "symbols-outline")
if not ok then
    return
end

symbols_outline.setup()
