local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

-- Toggleterm options
toggleterm.setup({
    size = 100,
    open_mapping = [[<a-t>]],
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        width = function(_)
            return math.floor(vim.o.columns * 0.75);
        end,
        height = function(_)
            return math.floor(vim.o.lines * 0.75);
        end,
        border = "single",
    },
})

function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, 't', '<a-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<a-k>', [[<C-\><C-n><C-W>k]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
