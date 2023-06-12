local ok, nvim_tree = pcall(require, 'nvim-tree')
if not ok then
    return
end

local function on_attach(bufnr)
    local api = require('nvim-tree.api')
    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    -- previous remove_keymaps
    vim.keymap.set('n', '<C-t>', '', { buffer = bufnr })
    vim.keymap.del('n', '<C-t>', { buffer = bufnr })

    -- custom mappings
    vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
    vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
    vim.keymap.set('n', 'H', api.node.open.horizontal, opts('Open: Horizontal Split'))
    vim.keymap.set('n', 't', api.node.open.tab, opts('Open: New Tab'))
end

-- Nvimtree options
nvim_tree.setup {
  renderer = {
    root_folder_modifier = ":t",
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  on_attach = on_attach,
  view = {
    width = 35,
    side = "left",
  },
}
