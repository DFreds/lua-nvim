" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

Plug 'nvim-lua/popup.nvim' " Popup API
Plug 'nvim-lua/plenary.nvim' " Utility functions

Plug 'nvim-telescope/telescope.nvim' " Fuzzy finder
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } " use fzf natively in telescope

Plug 'folke/trouble.nvim' " diagnostic helper

" LSP stuff
Plug 'neovim/nvim-lspconfig' " LSP auto configuration
Plug 'williamboman/nvim-lsp-installer' " lsp installer
Plug 'onsails/lspkind-nvim' " add pictograms to lsp

" Completion stuff
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-vsnip'

" Snippet
Plug 'hrsh7th/vim-vsnip'

Plug 'kosayoda/nvim-lightbulb' " show lightbulb next to code actions
Plug 'weilbith/nvim-code-action-menu' " nice code action menu
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " Treesitter syntax. Updates parsers on update
Plug 'lewis6991/gitsigns.nvim' " git gutter signs, requires setup in config
Plug 'glepnir/dashboard-nvim' " dashboard on open
Plug 'windwp/nvim-autopairs' " auto add pairs like ()
Plug 'lukas-reineke/indent-blankline.nvim' " show indent lines
Plug 'farmergreg/vim-lastplace' " remember last location in files
Plug 'tpope/vim-projectionist' " go between test and implementation files quickly
Plug 'ntpeters/vim-better-whitespace' " auto stripping of whitespace
Plug 'godlygeek/tabular' " alignment helper

" Movement plugins
Plug 'ggandor/lightspeed.nvim' " vim sneak on crack
Plug 'phaazon/hop.nvim' " new easy motion

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua' " file tree
Plug 'numtostr/FTerm.nvim' " Floating terminal
Plug 'b3nj5m1n/kommentary' " commenting support
Plug 'vim-test/vim-test' " testing in vim support
" Plug 'mhartington/formatter.nvim' " formatter
Plug 'max397574/better-escape.nvim' " escaping insert without delay
Plug 'dense-analysis/ale' " auto formatting and linting
Plug 'akinsho/bufferline.nvim' " bufferline
Plug 'famiu/bufdelete.nvim' " delete buffers while keeping window layout
Plug 'schickling/vim-bufonly' " delete all but current buffer
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } } " documentation generator
Plug 'nvim-lualine/lualine.nvim' " status line
Plug 'tpope/vim-rails' " rails support
Plug 'tpope/vim-repeat' " allow for more commands to be repeatable
Plug 'tpope/vim-dispatch' " async support
Plug 'tpope/vim-fugitive' " git commands
Plug 'tpope/vim-bundler' " bundler commands
Plug 'tpope/vim-surround' " surround commands
Plug 'folke/zen-mode.nvim' " zen mode
Plug 'folke/twilight.nvim' " dim inactive parts of the code
Plug 'junegunn/gv.vim' " git commit browser
Plug 'sainnhe/gruvbox-material' " colorscheme gruvbox

Plug 'luukvbaal/stabilize.nvim' " stabilize windows

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
