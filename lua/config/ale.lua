-- TOOD eventually convert this to formatter?
vim.g.ale_disable_lsp = 1
vim.g.ale_fix_on_save = 1
vim.g.ale_sign_error = '>>'
vim.g.ale_sign_warning = '--'
vim.g.ale_ruby_rubocop_executable = 'bundle'

vim.g.ale_linters = {
  javascript = {
    'eslint', 'tsserver'
  }
}

vim.g.ale_fixers = {
  javascript = { 'prettier', 'eslint', 'remove_trailing_lines' },
  ruby = { 'rubocop', 'remove_trailing_lines' },
  markdown = { 'prettier', 'remove_trailing_lines' },
  lua = { 'lua-format', 'remove_trailing_lines' },
}
