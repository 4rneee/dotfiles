local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require "telescope.actions"

local builtin = require('telescope.builtin')

local function find(opts)
    vim.fn.system("git rev-parse --is-inside-work-tree")
    local is_inside_work_tree = vim.v.shell_error == 0

    if is_inside_work_tree then
        builtin.git_files(opts)
    else
        builtin.find_files(opts)
    end
end

-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>ff', builtin.git_files, {})
vim.keymap.set('n', '<leader>ff', find, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

telescope.setup {
    defaults = {

        selection_caret = "  ",
        path_display = { "smart" },
        file_ignore_patterns = { ".git/", "node_modules" },

        mappings = {
            i = {
                ["<A-q>"] = actions.close,
                ["<A-j>"] = actions.move_selection_next,
                ["<A-k>"] = actions.move_selection_previous,
                ["<A-u>"] = actions.preview_scrolling_up,
                ["<A-d>"] = actions.preview_scrolling_down,
                ["<C-v>"] = actions.select_vertical,
                ["<C-h>"] = actions.select_horizontal,
            },
        },
    },
}
