require("bufferline").setup {
  options = {
    diagnostics = "nvim_diagnostic",
    diagnostics_indicator = function(count, level, _, _)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left"
      }
    },
    separator_style = "slant",
    show_buffer_close_icons = false
  }
}
