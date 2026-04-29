local ok, packer = pcall(require, "packer")
if not ok then
    return
end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return packer.startup(function(use)

    use {
        'lewis6991/gitsigns.nvim',
        event = { "CursorMoved", "CursorMovedI" },
        config = function()
            require("gitsigns")
        end
    }

    use "wbthomason/packer.nvim" -- plugin manager
    use "kyazdani42/nvim-web-devicons" -- Lua fork of vim-web-devicons
    use "kyazdani42/nvim-tree.lua" -- file tree
    use "romus204/tree-sitter-manager.nvim" -- Treesitter manager
    use "nvim-treesitter/nvim-treesitter-context" -- context
    use "norcalli/nvim-colorizer.lua" -- Colors highlighter
    use 'marko-cerovac/material.nvim' -- material colorscheme
    use 'neovim/nvim-lspconfig'
    use {
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'L3MON4D3/LuaSnip',
    }
end)
