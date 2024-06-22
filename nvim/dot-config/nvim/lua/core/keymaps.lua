local map = vim.keymap.set

map("", ",", "<Nop>", {})
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-----------------
-- Normal Mode --
-----------------

-- center cursor after certain actions
map("n", "n", "nzz", {})
map("n", "N", "Nzz", {})
map("n", "<C-d>", "<C-d>zz", {})
map("n", "<C-u>", "<C-u>zz", {})

-- switch between tabs
map("n", "J", "gT", {})
map("n", "K", "gt", {})

-- unhighlight search
map("n", "<F4>", ":set hlsearch!<CR>", {})

-- Nvim Comment
map("n", "<leader>c", ":CommentToggle<CR>", {}) -- Comment One Line
map("x", "<leader>c", ":'<,'>CommentToggle<CR>", {}) -- Comment Multiple Lines In Visual Mode

-- Don't accidently create macros when trying to quit
map('n', 'Q', 'q', {})
map('n', 'q', '<nop>', {})

-- Toggle NvimTree
map("n", "<C-t>", ":NvimTreeToggle<CR>", {})

-- Telescope (others are in configs/telescope.lua)
map("n", "<leader>gs", ":Telescope git_status<CR>", {}) -- git status

-- GitSigns
map('n', "<leader>gp", ":Gitsigns preview_hunk<CR>", {}) -- preview_hunk
map('n', "<leader>gr", ":Gitsigns reset_hunk<CR>", {}) -- reset_hunk

-- Toggle Code outline
map('n', "<F8>", ":SymbolsOutline<CR>")

-- show diagnostics
map("n", "<A-e>", vim.diagnostic.open_float, {})

-- format the current buffer
map('n', "<leader>fm", ":lua vim.lsp.buf.format()<CR>", {})

-----------------
-- Insert Mode --
-----------------


-----------------
-- Visual Mode --
-----------------
-- Move Text Up And Down
vim.cmd([[
nnoremap <C-A-J> :m .+1<CR>==
nnoremap <C-A-K> :m .-2<CR>==
inoremap <C-A-J> <Esc>:m .+1<CR>==gi
inoremap <C-A-K> <Esc>:m .-2<CR>==gi
vnoremap <C-A-J> :m '>+1<CR>gv=gv
vnoremap <C-A-K> :m '<-2<CR>gv=gv
]])
