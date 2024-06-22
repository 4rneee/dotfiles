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
    use "nvim-treesitter/nvim-treesitter" -- Treesitter
    use "nvim-treesitter/nvim-treesitter-context" -- context
    use "nvim-lualine/lualine.nvim" -- statusline
    use "akinsho/nvim-toggleterm.lua" -- toggle terminal
    use "terrortylor/nvim-comment" -- Comment toggler
    use "norcalli/nvim-colorizer.lua" -- Colors highlighter
    use "lewis6991/impatient.nvim" -- Speed up loading Lua modules to improve startup time
    use 'nvim-telescope/telescope.nvim' -- Find, filter, preview, pick. all lua, with telescope
    use 'nvim-lua/plenary.nvim' -- Plenary, a dependency of telescope
    use 'marko-cerovac/material.nvim' -- material colorscheme
    use 'lukas-reineke/indent-blankline.nvim' -- indent lines
    use 'm4xshen/autoclose.nvim' -- autoclose brackets and other stuff
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use {
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'L3MON4D3/LuaSnip',
    }
    use "simrat39/symbols-outline.nvim" -- code outline
end)
