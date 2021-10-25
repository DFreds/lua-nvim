require "lualine" .setup {
  options = {
    icons_enabled = true,
    theme = "auto", -- https://github.com/hoob3rt/lualine.nvim/blob/master/THEMES.md
    section_separators = { left = '', right = ''},
    component_separators = { left = '', right = ''},
    -- component_separators = { left = '', right = ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch", "diff"},
    lualine_c = {
      {
        "filetype",
        icon_only = true,
      },
      {
        "filename",
        file_status = false,
        path = 1, -- relative path
      },
      "diagnostics"
    },
    lualine_x = {"encoding", "filetype"},
    lualine_y = {"location", "progress"},
    lualine_z = {""}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { "nvim-tree", "fugitive", "quickfix" }
}
