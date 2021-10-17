require('nvim-tree').setup {
  tree_icons = {
    default = "",
    symlink = "",
    git = {
      unstaged = "",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      deleted = "",
      untracked = "U",
      ignored = "◌",
    },
    folder = {
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
    },
  },
  show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
  },
  diagnostics = {
    enable = true,
  },
  tree_ignore = { '.git', 'node_modules', '.cache' }, -- don't show these files/folders in tree
  indent_markers = 1, -- this option shows indent markers when folders are open
}

local nvimtree = {}

local _, view = pcall(require, "nvim-tree.view")
nvimtree.toggle_tree = function()
  if view.win_open() then
    require("nvim-tree").close()
  else
    require("nvim-tree").find_file(true)
  end
end

return nvimtree
