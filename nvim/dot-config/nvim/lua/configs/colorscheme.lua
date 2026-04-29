require('material')
local ok, material = pcall(require, 'material')
if not ok then
    return
end

vim.g.material_style = "deep ocean"
-- vim.g.material_style = "lighter"

material.setup({
    plugins = {
    -- Available plugins:
    -- "dap",
    -- "dashboard",
    "gitsigns",
    -- "hop",
    "indent-blankline",
    -- "lspsaga",
    -- "mini",
    -- "neogit",
    "nvim-cmp",
    -- "nvim-navic",
    "nvim-tree",
    "nvim-web-devicons",
    -- "sneak",
    "telescope",
    -- "trouble",
    -- "which-key",
},
    disable = {
        -- eob_lines = false,
        background = true,
    },
    high_visibility = {
        lighter = true,
        darker = true,
    },
    custom_colors = function(colors)
        if vim.g.material_style == "deep ocean" then
            colors.editor.fg = "#ffffff"
            colors.syntax.variable = "#ffffff"
            colors.syntax.comments = "#888888"
        end
    end,
    custom_highlights = {
        Search = {fg = "#000000", bg = "#ff7700", italic = false},
        CurSearch = {fg = "#000000", bg = "#ffff00", italic = false},
        IncSearch = {fg = "#000000", bg = "#ffff00", italic = false},
    }
})

vim.cmd "colorscheme material"

-- change colorsheme
local functions = require('material.functions')
vim.keymap.set("n", "<Leader>t", functions.find_style, {})

-- line to show max column with
vim.opt.colorcolumn='101'
-- vim.opt.colorcolumn='81'
