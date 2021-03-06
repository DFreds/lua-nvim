local utils = require "utils"

local default_mappings = {
  i = { -- insert mode
    -- Move current line / block with Alt-j/k ala vscode.
    { "<A-j>", "<Esc>:m .+1<CR>==gi" },
    { "<A-k>", "<Esc>:m .-2<CR>==gi" },

    -- Move current line / block with Alt-j/k ala vscode. Weird mappings courtesy of mac
    { "∆", "<Esc>:m .+1<CR>==gi" },
    { "˚", "<Esc>:m .-2<CR>==gi" },

    -- Terminal window navigation
    { "<C-h>", "<C-\\><C-N><C-w>h" },
    { "<C-j>", "<C-\\><C-N><C-w>j" },
    { "<C-k>", "<C-\\><C-N><C-w>k" },
    { "<C-l>", "<C-\\><C-N><C-w>l" },
  },
  n = { -- normal mode
    { ";", ":", { silent = false} }, -- use ; to enter command mode
    { "Q", "<nop>" }, -- disable Ex mode
    { "0", "<cmd>call HomeToggle()<cr>" }, -- Toggle jumping between the beginning of the line and the first character
    { "//", "<cmd>nohlsearch<cr>" }, -- clear highlights

    { "c", '"_c' }, -- redirect change operations to black hole
    { "C", '"_C' }, -- redirect change operations to black hole

    { "<backspace>", "<C-^>" }, -- easy way to switch between the last two buffers

    { "<C-a>", ":%y+<CR>" }, -- copy the full file content

    { "<C-h>", "<C-w>h" }, -- move left a window easier
    { "<C-j>", "<C-w>j" }, -- move down a window easier
    { "<C-k>", "<C-w>k" }, -- move up a window easier
    { "<C-l>", "<C-w>l" }, -- move right a window easier

    { "<S-Up>", "<cmd>resize -2<CR>" }, -- make current window smaller vertically
    { "<S-Down>", "<cmd>resize +2<CR>" }, -- make current window bigger vertically
    { "<S-Left>", "<cmd>vertical resize -2<CR>" }, -- make current window smaller horizontally
    { "<S-Right>", "<cmd>vertical resize +2<CR>" }, -- make current window bigger horizontally

    -- Move current line / block with Alt-j/k ala vscode.
    { "<A-j>", ":m .+1<CR>==" },
    { "<A-k>", ":m .-2<CR>==" },

    -- Move current line / block with Alt-j/k ala vscode. Weird mappings courtesy of mac
    { "∆", ":m .+1<CR>==" },
    { "˚", ":m .-2<CR>==" },

    -- QuickFix
    { "]q", "<cmd>cnext<CR>" },
    { "[q", "<cmd>cprev<CR>" },

    -- replace by bufferline mappings
    -- { "<S-l>", "<cmd>bnext<CR>" }, -- move to next buffer
    -- { "<S-h>", "<cmd>bprevious<CR>" }, -- move to previous buffer

    { "<leader>w", "<cmd>update!<cr>", { silent = false } }, -- fast saving
    { "<leader>x", "<cmd>xit<cr>", { silent = false }  }, -- fast saving and quitting

    { ">", ">>_" }, -- easier adding indent on line
    { "<", "<<_" }, -- easier removing indent on line

    { "<leader>nu", "<cmd>call NewUuid()<cr>" }, -- generate a new UUID

    { "<leader>q", "<cmd>call ToggleQuickFix()<cr>" }, -- show or hide the quickfix
    { "<leader>sd", "<cmd>execute 'DevDocs ' . expand('<cword>')<cr>"}, -- open https://devdocs.io and search for the word under the cursor
  },
  t = { -- terminal mode
    { "<C-o>", [[<C-\><C-n><esc><cr>]] }, -- navigate terminal in normal mode

    -- Terminal window navigation
    { "<C-h>", "<C-\\><C-N><C-w>h" },
    { "<C-j>", "<C-\\><C-N><C-w>j" },
    { "<C-k>", "<C-\\><C-N><C-w>k" },
    { "<C-l>", "<C-\\><C-N><C-w>l" },
  },
  v = { -- visual/select mode
    { ";", ":", { silent = false} }, -- use ; to enter command mode

    { "<", "<gv" }, -- reselect visual selection after adding indent on line
    { ">", ">gv" }, -- reselect visual selection after removing indent on line

    { "p", '"_dP' }, -- don't copy the replaced text when pasting
  },
  x = { -- visual mode
    { "K", ":move '<-2<CR>gv-gv" }, -- move selected line/block up => note, can't use <Cmd>
    { "J", ":move '>+1<CR>gv-gv" }, -- move selected line/block down => note, can't use <Cmd>

    -- Move current line / block with Alt-j/k ala vscode.
    { "<A-j>", ":m '>+1<CR>gv-gv" },
    { "<A-k>", ":m '<-2<CR>gv-gv" },

    -- Move current line / block with Alt-j/k ala vscode. Weird mappings courtesy of mac
    { "∆", ":m '>+1<CR>gv-gv" },
    { "˚", ":m '<-2<CR>gv-gv" },
  },
  [""] = {
    -- Toggle the QuickFix window
    -- { "<C-q>", ":call QuickFixToggle()<CR>" },
  },
}

local fugitive_mappings = {
  n = { -- normal mode
    { "<leader>gs", "<cmd>Git<cr>" }, -- git status
    { "<leader>gd", "<cmd>Git diff<cr>" }, -- git diff
    { "<leader>gc", "<cmd>Git commit<cr>" }, -- git commit
    { "<leader>gb", "<cmd>Git blame<cr>" }, -- git commit
    { "<leader>gl", "<cmd>Git log<cr>" }, -- git commit
    { "<leader>gp", "<cmd>Git push<cr>" }, -- git commit
  },
}

local hop_mappings = {
  n = { -- normal mode
    { "<leader><leader>w", "<cmd>HopWord<cr>" }, -- Hop to word
    { "<leader><leader>l", "<cmd>HopLine<cr>" }, -- Hop to line
  },
  v = { -- visual mode
    { "<leader><leader>w", "<cmd>HopWord<cr>" }, -- Hop to word
    { "<leader><leader>l", "<cmd>HopLine<cr>" }, -- Hop to line
  },
  x = { -- visual mode
    { "<leader><leader>w", "<cmd>HopWord<cr>" }, -- Hop to word
    { "<leader><leader>l", "<cmd>HopLine<cr>" }, -- Hop to line
  },
}

local telescope_mappings = {
  n = { -- normal mode
    { "<leader>f", "<cmd>Telescope git_files<cr>" },  -- find git files
    { "<leader>sf", "<cmd>Telescope find_files hidden=true<cr>" },  -- find all files
    { "<leader>sw", "<cmd>Telescope grep_string<cr>" }, -- find word under cursor
    -- { "<leader>sg", '<cmd>lua require("telescope.builtin").grep_string({ search = vim.fn.input("🔍 ")})<CR>' },
    { "<leader>sg", "<cmd>Telescope live_grep<cr>" },  -- find find with grep
    { "<leader>ss", "<cmd>Telescope builtin<cr>" },  -- find telescope commands
    { "<leader>sr", "<cmd>Telescope oldfiles<cr>" },  -- find recent files
    { "<leader>sb", "<cmd>Telescope buffers<cr>" },  -- find buffers
    { "<leader>st", "<cmd>Telescope tags<cr>" },  -- find tags
    { "<leader>sh", "<cmd>Telescope help_tags<cr>" },  -- find help tags
    { "<leader>sc", "<cmd>Telescope command_history<cr>" },  -- find command history
    { "<leader>sk", "<cmd>Telescope keymaps<cr>" },  -- find keymaps
    { '<leader>s"', "<cmd>Telescope registers<cr>" },  -- find registers
    { "<leader>sl", "<cmd>Telescope resume<cr>" },  -- rerun last search
    { "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>" },  -- find in current buffer
    { "<leader>gsc", "<cmd>Telescope git_commits<cr>" },  -- find git commits
    { "<leader>gsbc", "<cmd>Telescope git_bcommits<cr>" },  -- find git buffer commits
    { "<leader>gsb", "<cmd>Telescope git_branches<cr>" },  -- find git branches
  },
}

local vim_test_mappings = {
  n = { -- normal mode
    { "<leader>tn", "<cmd>TestNearest<cr>" }, -- run nearest test
    { "<leader>tf", "<cmd>TestFile<cr>" }, -- run tests for file
    { "<leader>ts", "<cmd>TestSuite<cr>" }, -- run all tests
    { "<leader>tl", "<cmd>TestLast<cr>" }, -- run last tests you ran
    { "<leader>tv", "<cmd>TestVisit<cr>" }, -- go to last test file
  }
}

local vim_projectionist_mappings = {
  n = { -- normal mode
    { "<leader>a", "<cmd>A<cr>" }, -- go to alternate file
    { "<leader>va", "<cmd>AV<cr>" }, -- split alternate file vertically
  }
}

local nvim_tree_mappings = {
  n = { -- normal mode
    { "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>" }, -- toggle the tree
  }
}

local bufferline_mappings = {
  n = { -- normal mode
    { "[b", "<cmd>BufferLineCyclePrev<cr>" },
    { "]b", "<cmd>BufferLineCycleNext<cr>" },
    { "<leader>bp", "<cmd>BufferLinePick<cr>" },
  }
}

local bufdelete_mappings = {
  n = {
    { "<leader>bd", "<cmd>Bdelete!<cr>" },
  }
}

local bufonly_mappings = {
  n = {
    { "<leader>bo", "<cmd>BufOnly<cr>" },
  }
}

local fterm_mappings = {
  n = { -- normal mode
    { "<leader>tt", "<CMD>lua require('FTerm').toggle()<CR>" }, -- toggle terminal when it is closed
  },
  t = { -- terminal mode
    { "<leader>tt", "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>" }, -- toggle terminal when it is open
  }
}

local dashboard_mappings = {
  n = { -- normal mode
    { "<leader>;", "<cmd>Dashboard<cr>" } -- open the dashboard again
  }
}

local ale_mappings = {
  n = { -- normal mode
    { "[a", "<Plug>(ale_previous_wrap)", { noremap = false } }, -- go to previous ale lint issue
    { "]a", "<Plug>(ale_next_wrap)", { noremap = false } }, -- go to next ale lint issue
  }
}

local trouble_mappings = {
  n = { -- normal mode
    { "<leader>d", "<cmd>TroubleToggle<cr>" },
  }
}

local zen_mode_mappings = {
  n = { -- normal mode
    { "<leader>z", "<cmd>ZenMode<cr>" },
  }
}

local tabular_mappings = {
  i = { -- insert mode
    { "<bar>", "<bar><esc><cmd>call Align()<cr>" }
  }
}

local lsp_mappings = {
  n = { -- normal mode
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    { 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>' },
    { 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>' },
    { 'K', '<cmd>lua vim.lsp.buf.hover()<CR>' },
    { 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>' },
    -- { '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>' },
    { '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>' },
    { '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>' },
    { '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>' },
    { '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>' },
    { '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>' },
    { '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>' },
    { 'gr', '<cmd>lua vim.lsp.buf.references()<CR>' },
    { '<leader>ce', '<cmd>lua vim.diagnostic.open_float()<CR>' },
    { '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>' },
    { ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>' },
    { '<leader>cq', '<cmd>lua vim.diagnostic.setloclist()<CR>' },
    { '<leader>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>' },
  }
}

utils.register_mappings(default_mappings)
utils.register_mappings(fugitive_mappings)
utils.register_mappings(hop_mappings)
utils.register_mappings(telescope_mappings)
utils.register_mappings(vim_test_mappings)
utils.register_mappings(vim_projectionist_mappings)
utils.register_mappings(nvim_tree_mappings)
utils.register_mappings(bufferline_mappings)
utils.register_mappings(bufdelete_mappings)
utils.register_mappings(bufonly_mappings)
utils.register_mappings(fterm_mappings)
utils.register_mappings(dashboard_mappings)
utils.register_mappings(ale_mappings)
utils.register_mappings(trouble_mappings)
utils.register_mappings(zen_mode_mappings)
utils.register_mappings(tabular_mappings)
utils.register_mappings(lsp_mappings)
