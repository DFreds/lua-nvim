" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

Plug 'nvim-lua/popup.nvim' " Popup API
Plug 'nvim-lua/plenary.nvim' " Utility functions

Plug 'nvim-telescope/telescope.nvim' " Fuzzy finder

Plug 'neovim/nvim-lspconfig' " LSP auto configuration
Plug 'hrsh7th/nvim-compe' " completion
Plug 'kabouzeid/nvim-lspinstall' " lsp installer, requires setup in config

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " Treesitter syntax. Updates parsers on update

Plug 'lewis6991/gitsigns.nvim' " git gutter signs, requires setup in config

Plug 'lukas-reineke/indent-blankline.nvim' " show indent lines

Plug 'farmergreg/vim-lastplace' " remember last location in files

Plug 'tpope/vim-projectionist' " go between test and implementation files quickly

Plug 'ntpeters/vim-better-whitespace' " auto stripping of whitespace
  " 'godlygeek/tabular'; -- auto alignment based on character
  " 'mhinz/vim-startify'; -- start screen and session management
Plug 'ggandor/lightspeed.nvim' " vim sneak on crack

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua' " file tree

Plug 'b3nj5m1n/kommentary' " commenting support

Plug 'hrsh7th/vim-vsnip' " snippets
Plug 'rafamadriz/friendly-snippets' " more snippets

Plug 'vim-test/vim-test' " testing in vim support
" Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' } " better testing

Plug 'romgrk/barbar.nvim' " tabline
Plug 'hoob3rt/lualine.nvim' " status line
Plug 'tpope/vim-rails' " rails support
Plug 'tpope/vim-repeat' " allow for more commands to be repeatable
Plug 'tpope/vim-dispatch' " async support
Plug 'tpope/vim-fugitive' " git commands
Plug 'tpope/vim-bundler' " bundler commands

" Plug 'glepnir/dashboard-nvim' " dashboard and sessions TODO some config
" required

Plug 'junegunn/gv.vim' " git commit browser

Plug 'sainnhe/gruvbox-material' " colorscheme gruvbox

" Initialize plugin system
call plug#end()

" " Specify a directory for plugins
" " - For Neovim: stdpath('data') . '/plugged'
" " - Avoid using standard Vim directory names like 'plugin'
" call plug#begin('~/.vim/plugged')

" " Make sure you use single quotes

" " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" " Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" " Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" " On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" " Using a non-default branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" " Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" " Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" " Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" " Initialize plugin system
" call plug#end()
