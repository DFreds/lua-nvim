vim.g.nvim_tree_icons = {
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
}
vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 1,
}
vim.g.nvim_tree_lsp_diagnostics = 1 -- show lsp diagnostics in the signcolumn
vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' } -- don't show these files/folders in tree
vim.g.nvim_tree_indent_markers = 1 -- this option shows indent markers when folders are open

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
