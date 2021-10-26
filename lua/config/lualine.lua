local function vim_icon() return '  ' end

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
    lualine_a = {vim_icon, "mode"},
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
      {
        "diagnostics",
        sources = {'nvim_lsp'},
        sections = {'error', 'warn', 'info', 'hint'},
        symbols = {error = '﯇ ', warn = ' ', info = ' ', hint = ' '},
      },
    },
    lualine_x = {"encoding", "filetype"},
    lualine_y = {"location", "progress"},
    lualine_z = {""}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
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
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { "nvim-tree", "fugitive", "quickfix" }
}
