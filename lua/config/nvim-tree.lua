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
