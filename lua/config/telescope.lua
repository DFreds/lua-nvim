local telescope = require 'telescope'

telescope.setup {
  defaults = {
    dynamic_preview_title = true,
    file_ignore_patterns = { "^features/auto_mocks/", "^features/support/__recordings__/" },
    mappings = {
      i = {
        ["<esc>"] = require('telescope.actions').close,
        ["jj"] = require('telescope.actions').close,
        ["jk"] = require('telescope.actions').close,
        ["kj"] = require('telescope.actions').close,
        ["<Down>"] = require('telescope.actions').cycle_history_next,
        ["<Up>"] = require('telescope.actions').cycle_history_prev
      }
    },
    prompt_prefix = "🔍 ",
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden' -- non-default addition
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension('fzf')
