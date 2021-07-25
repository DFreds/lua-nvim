-- change to dispatch to run async in quickfix
vim.api.nvim_exec(
[[
  let test#strategy = { 'nearest': 'neovim', 'file': 'neovim', 'suite': 'neovim' }
  let g:test#echo_command = 0
  let test#neovim#term_position = 'vert'
]],
true)
