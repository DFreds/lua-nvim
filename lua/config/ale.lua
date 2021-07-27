-- eventually convert this to formatter
vim.cmd [[
let g:ale_disable_lsp = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

let g:ale_ruby_rubocop_executable = 'bundle'

let g:ale_linters = {'javascript': ['eslint', 'tsserver']}
let g:ale_fixers = {'javascript': ['prettier', 'eslint', 'remove_trailing_lines'], 'ruby': ['rubocop', 'remove_trailing_lines'], 'markdown': ['prettier', 'remove_trailing_lines']}

" Map movement through errors with wrapping around the file.
nmap <silent> <leader>ap <Plug>(ale_previous_wrap)
nmap <silent> <leader>an <Plug>(ale_next_wrap)
]]
