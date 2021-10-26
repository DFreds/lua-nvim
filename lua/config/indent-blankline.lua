require 'indent_blankline'.setup {
  use_treesitter = true,
  show_first_indent_level = false,
  buftype_exclude = {'help', 'terminal', 'dashboard', 'NvimTree'},
  filetype_exclude = {'help', 'terminal', 'dashboard', 'NvimTree'},
  show_current_context = true,
  context_patterns = {'call', 'class', 'function', 'method', 'pair'},
}
