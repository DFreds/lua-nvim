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
  -- foldexpr = "nvim_treesitter#foldexpr()", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
  -- foldmethod = "expr", -- folding, set to "expr" for treesitter based folding
  backup = false, -- disable creating backup files
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 2, -- make command bar height slightly larger
  colorcolumn = "80", -- display ruler at 80 characters
  completeopt = { "menu", "menuone", "noselect" }, -- use popup menu when there is only one match and do not automatically select a match in the menu
  conceallevel = 0, -- so that `` is visible in markdown files
  cursorline = true, -- highlight the cursor line
  expandtab = true, -- use spaces instead of tabs
  fileencoding = "utf-8", -- the encoding written to a file
  fileformats = 'unix,dos,mac', -- use unix as the standard file format
  guifont = "monospace:h17", -- the font used in graphical neovim applications
  hidden = true, -- switch between buffers without having to save first
  history = 500, -- how many commands to remember
  hlsearch = true, -- highlight all matches on previous search
  icm = "split", -- text substitution applies in the buffer and shows changes in split window
  ignorecase = true, -- ignore case when searching
  mouse = "i", -- allow the mouse to be used in insert mode in neovim
  number = true, -- show line numbers
  pumheight = 10, -- pop up menu height
  relativenumber = false, -- show absolute line number
  report = 0, -- always report number of lines changed
  scrolloff = 8, -- number of lines allowed above/below of the cursor before the window scrolls
  shiftround = true, -- round indent to multiple of 'shiftwidth'
  shiftwidth = indent, -- the number of spaces inserted for each indentation
  showmode = false, -- hide the mode at the bottom
  sidescrolloff = 8, -- number of characters allowed in front/back of the cursor before the window scrolls
  signcolumn = "yes", -- always show sign colunn
  smartcase = true, -- only ignore case if all letters are lowercase
  smartindent = true, -- smart autoindenting
  spell = false, -- disable spell checking
  spelllang = "en_us", -- default spell checking is English US if enabled
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- disable creationg of swapfiles
  switchbuf = "useopen", -- use open buffer when switching between files if it is already open
  tabstop = indent, -- tab key indents by ${indent} spaces
  termguicolors = true, -- enable 24-bit RGB color
  timeoutlen = 500, -- timeout in ms to wait for a command sequnce to complete
  title = true, -- set the title of window to the value of the titlestring
  undodir = CACHE_PATH .. "/undo", -- set an undo directory
  undofile = true, -- enable persistent undo
  updatetime = 300, -- faster completion
  wildignore = '*.class,*.git,*.o,*~,*.pyc', -- ignore compiled files and git
  wildmode = 'list:longest,full', -- when more than one match, list all matches and complete till longest common string
  wrap = false, -- always display lines as one long line
}

vim.g.mapleader = ' ' -- use space as the leader
vim.cmd 'colorscheme gruvbox-material' -- colorscheme to use

utils.disable_built_ins(plugins_to_disable) -- disable unused default plugins
utils.register_options(default_options) -- register all default options

vim.opt.shortmess:append "c" -- don't pass messages to ins-completion-menu
vim.opt.whichwrap:append "h,l" -- allow specified keys to go to previous/next line when at first/last character

vim.cmd 'filetype plugin indent on' -- enable plugins and indentation files for filetypes

utils.define_augroups(
  {
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
)
