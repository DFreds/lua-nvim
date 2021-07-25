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

return utils
