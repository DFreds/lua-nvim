runtime plugins.vim

lua << EOF
require "default-config"
require "keymappings"
require "lsp-config"
require "config"
EOF
