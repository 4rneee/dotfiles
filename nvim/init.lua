-- highly inspired by luavim (https://github.com/elairavi/luavim)

local core_modules = {

---- Core Settings ----------------------------------
"core/keymaps",           -- Custom Keymaps
"core/plugins",           -- Plugins + Packer Config
"core/options",           -- General Options

---- Plugin Configurations --------------------------
"configs/completion",     -- Auto Completion
"configs/impatient",      -- Improve Startup Time
"configs/colorscheme",
"configs/treesitter",     -- Syntax Highlighting
"configs/statusline",     -- Status Line
"configs/commentary",     -- Easily Comment Lines
"configs/nvimtree",       -- File Explorer
"configs/gitsigns",       -- Git Integration
"configs/telescope",      -- Fuzzy finder
"configs/colorizer",      -- Colors Highlighter
"configs/toggleterm",     -- Floating Terminal
"configs/autoclose",      -- autoclose brackets
"configs/lsp_config",
"configs/symbols-outline",

---- Other Utilities --------------------------------
 -- "utils/utils",            -- Utilities

}
-- Using pcall we can handle better any loading issues
for _, module in ipairs(core_modules) do
    local ok, _ = pcall(require, module)
    if not ok then
        return
    end
end

