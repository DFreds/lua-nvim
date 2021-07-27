--[[ local utils = require("utils")

require("formatter").setup({
  logging = false,
  filetype = {
    javascript = {
        -- prettier
       function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote', '--remove-trailing-lines'},
            stdin = true
          }
        end
    },
    lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
    },
  }
})

utils.define_augroups {
  autoformat = {
    {
      "BufWritePost",
      "*",
      ":silent FormatWrite",
    },
  },
  } ]]
