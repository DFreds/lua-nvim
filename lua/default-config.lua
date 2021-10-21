local utils = require "utils"

CONFIG_PATH = vim.fn.stdpath "config"
DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"

local plugins_to_disable = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin", -- 'man',
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  -- 'matchit', 'matchparen', 'shada_plugin',
}

local indent = 2
local default_options = {
  timeoutlen = 500, -- timeout in ms to wait for a command sequnce to complete TODO consider lowering if which key is setup
  switchbuf = "useopen", -- use open buffer when switching between files if it is already open
  fileencoding = "utf-8", -- the encoding written to a file
  showmode = false, -- hide the mode at the bottom
  report = 0, -- always report number of lines changed
  scrolloff = 7, -- number of lines allowed below the cursor before the window scrolls
  wrap = false, -- always display lines as one long line
  backup = false, -- disable creating backup files
  hlsearch = true, -- highlight all matches on previous search
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 2, -- make command bar height slightly larger
  smartindent = true, -- smart autoindenting
  conceallevel = 0, -- so that `` is visible in markdown files
  colorcolumn = "80", -- display ruler at 80 characters
  hidden = true, -- switch between buffers without having to save first
  ignorecase = true, -- ignore case when searching
  smartcase = true, -- only ignore case if all letters are lowercase
  expandtab = true, -- use spaces instead of tabs
  spell = false, -- disable spell checking
  spelllang = "en_us", -- default spell checking is English US if enabled
  tabstop = indent, -- tab key indents by ${indent} spaces
  shiftwidth = indent, -- the number of spaces inserted for each indentation
  shiftround = true, -- round indent to multiple of 'shiftwidth'
  cursorline = true, -- highlight the cursor line
  undodir = CACHE_PATH .. "/undo", -- set an undo directory
  undofile = true, -- enable persistent undo
  signcolumn = "yes", -- always show sign colunn
  number = true, -- show line numbers
  relativenumber = false, -- show absolute line number
  updatetime = 300, -- faster completion
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  history = 500, -- how many commands to remember
  completeopt = { "menu", "menuone", "noselect" }, -- use popup menu when there is only one match and do not automatically select a match in the menu
  swapfile = false, -- disable creationg of swapfiles
  termguicolors = true, -- enable 24-bit RGB color
  guifont = "monospace:h17", -- the font used in graphical neovim applications
  mouse = "i", -- allow the mouse to be used in insert mode in neovim
  pumheight = 10, -- pop up menu height
}

vim.g.mapleader = ' ' -- use space as the leader
-- vim.g.colors_name = 'gruvbox-material' -- colorscheme must get called after plugins are loaded or it will break new installs
vim.cmd 'colorscheme gruvbox-material' -- colorscheme to use

utils.disable_built_ins(plugins_to_disable) -- disable unused default plugins
utils.register_options(default_options) -- register all default options

vim.opt.shortmess:append "c" -- don't pass messages to ins-completion-menu
vim.opt.whichwrap:append "h,l" -- allow specified keys to go to previous/next line when at first/last character

utils.define_augroups {
  _general = {
    {
      "TextYankPost",
      "*",
      "lua vim.highlight.on_yank {on_visual = true}"
    },
    {
      "WinEnter",
      "*",
      "set cursorline"
    },
    {
      "WinLeave",
      "*",
      "set nocursorline"
    },
  },
  _markdown = {
    { "FileType", "markdown", "setlocal wrap" },
    { "FileType", "markdown", "setlocal spell" },
  },
}

-- TODO autocmds

--[[ O = {
  line_wrap_cursor_movement = true,
  transparent_window = false,
  format_on_save = true,
  vsnip_dir = vim.fn.stdpath "config" .. "/snippets",

  plugin = {},

  -- TODO: refactor for tree
  auto_close_tree = 0,
  nvim_tree_disable_netrw = 0,

  lsp = {
    document_highlight = true,
    popup_border = "single",
  },

  database = { save_location = "~/.config/lunarvim_db", auto_execute = 1 },

  -- TODO: just using mappings (leader mappings)
  user_which_key = {},

  user_plugins = {
    -- use lv-config.lua for this not put here
  },

  user_autocommands = {
    { "FileType", "qf", "set nobuflisted" },
  },

  formatters = {
    filetype = {},
  },

  -- TODO move all of this into lang specific files, only require when using
  lang = {
    cmake = {
      formatter = {
        exe = "clang-format",
        args = {},
      },
    },
    clang = {
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      cross_file_rename = true,
      header_insertion = "never",
      filetypes = { "c", "cpp", "objc" },
      formatter = {
        exe = "clang-format",
        args = {},
      },
    },
    css = {
      virtual_text = true,
    },
    dart = {
      sdk_path = "/usr/lib/dart/bin/snapshots/analysis_server.dart.snapshot",
      formatter = {
        exe = "dart",
        args = { "format" },
      },
    },
    docker = {},
    efm = {},
    elm = {},
    emmet = { active = false },
    elixir = {},
    graphql = {},
    go = {
      formatter = {
        exe = "gofmt",
        args = {},
      },
    },
    html = {},
    java = {
      java_tools = {
        active = false,
      },
      formatter = {
        exe = "prettier",
        args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
      },
    },
    json = {
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      formatter = {
        exe = "python",
        args = { "-m", "json.tool" },
      },
    },
    kotlin = {},
    latex = {
      auto_save = false,
      ignore_errors = {},
    },
    lua = {
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      formatter = {
        exe = "stylua",
        args = {},
        stdin = false,
      },
    },
    php = {
      format = {
        format = {
          default = "psr12",
        },
      },
      environment = {
        php_version = "7.4",
      },
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      filetypes = { "php", "phtml" },
      formatter = {
        exe = "phpcbf",
        args = { "--standard=PSR12", vim.api.nvim_buf_get_name(0) },
        stdin = false,
      },
    },
    python = {
      -- @usage can be flake8 or yapf
      linter = "",
      isort = false,
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      analysis = {
        type_checking = "basic",
        auto_search_paths = true,
        use_library_code_types = true,
      },
      formatter = {
        exe = "yapf",
        args = {},
      },
    },
    ruby = {
      diagnostics = {
        virtualtext = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      filetypes = { "rb", "erb", "rakefile", "ruby" },
      formatter = {
        exe = "rufo",
        args = { "-x" },
      },
    },
    rust = {
      rust_tools = {
        active = false,
        parameter_hints_prefix = "<-",
        other_hints_prefix = "=>", -- prefix for all the other hints (type, chaining)
      },
      -- @usage can be clippy
      formatter = {
        exe = "rustfmt",
        args = { "--emit=stdout", "--edition=2018" },
      },
      linter = "",
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
    },
    sh = {
      -- @usage can be 'shellcheck'
      linter = "",
      -- @usage can be 'shfmt'
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      formatter = {
        exe = "shfmt",
        args = { "-w" },
        stdin = false,
      },
    },
    svelte = {},
    tailwindcss = {
      active = false,
      filetypes = {
        "html",
        "css",
        "scss",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      },
    },
    terraform = {
      formatter = {
        exe = "terraform",
        args = { "fmt" },
        stdin = false,
      },
    },
    tsserver = {
      -- @usage can be 'eslint' or 'eslint_d'
      linter = "",
      diagnostics = {
        virtual_text = { spacing = 0, prefix = "" },
        signs = true,
        underline = true,
      },
      formatter = {
        exe = "prettier",
        args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
      },
    },
    vim = {},
    yaml = {
      formatter = {
        exe = "prettier",
        args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
      },
    },
  },
} ]]


--[[
cmd 'syntax enable' -- enable syntax
cmd 'filetype plugin indent on'

cmd 'autocmd TextYankPost * lua vim.highlight.on_yank {on_visual = true}' -- Highlight on yank


-- checkout https://oroques.dev/notes/neovim-init/ for potentially not using the utils.opt
utils.opt('o', 'fileformats', 'unix,dos,mac') -- use unix as the standard file format
utils.opt('o', 'wildmode', 'list:longest,full') -- when more than one match, list all matches and complete till longest common string
utils.opt('o', 'wildignore', '*.class,*.git,*.o,*~,*.pyc') -- ignore compiled files and git
]]
