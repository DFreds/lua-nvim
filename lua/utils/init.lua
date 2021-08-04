local utils = { }

--[[
  @param {map} options
]]
function utils.register_options(options)
  for k, v in pairs(options) do
    vim.opt[k] = v
  end
end

function utils.disable_built_ins(plugins)
  for _, plugin in pairs(plugins) do
    vim.g["loaded_" .. plugin] = 1
  end
end

function utils.t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function utils.register_mappings(mappings)
  local default_options = { silent = true, noremap = true }

  for mode, mode_mappings in pairs(mappings) do
    for _, mapping in pairs(mode_mappings) do
      local options = #mapping == 3 and table.remove(mapping) or default_options
      local prefix, cmd = unpack(mapping)
      pcall(vim.api.nvim_set_keymap, mode, prefix, cmd, options)
    end
  end
end

-- Create autocommand groups based on the passed definitions
--
-- The key will be the name of the group, and each definition
-- within the group should have:
--    1. Trigger
--    2. Pattern
--    3. Text
-- just like how they would normally be defined from Vim itself
function utils.define_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.cmd("augroup " .. group_name)
    vim.cmd "autocmd!"

    for _, def in pairs(definition) do
      local command = table.concat(vim.tbl_flatten { "autocmd", def }, " ")
      vim.cmd(command)
    end

    vim.cmd "augroup END"
  end
end

-- Useful VIM commands
-- TODO port some to lua when possible
vim.cmd [[
function! Align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

function! ToggleQuickFix()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    copen
  else
    cclose
  endif
endfunction

function! CmdLine(str)
  call feedkeys(":" . a:str)
endfunction

function! NewUuid()
  let l:prefix = '@uuid-'
  call CmdLine("r !uuidgen|sed \'s/.*/" . l:prefix . "&/\'|tr \"[A-Z]\" \"[a-z]\"")
endfunction

function! GetUniqueSessionName()
  let path = fnamemodify(getcwd(), ':~:t')
  let path = empty(path) ? 'no-project' : path
  let branch = FugitiveHead()
  let branch = empty(branch) ? '' : '-' . branch
  return substitute(path . branch, '/', '-', 'g')
endfunction

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", "\\/.*'$^~[]")
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'gv'
    call CmdLine("Ack '" . l:pattern . "' " )
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

function HomeToggle()
  if (col('.') == 1)
    normal! ^
  else
    normal! 0
  endif
endfunction
]]

return utils
