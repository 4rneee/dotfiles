local ok, autoclose = pcall(require, "autoclose")
if not ok then
    return
end

autoclose.setup({})
