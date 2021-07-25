local utils = require "utils"

local default_mappings = {
  i = { -- insert mode
    { "jk", "<ESC>" }, -- shortcut for escape
    { "kj", "<ESC>" }, -- shortcut for escape
    { "jj", "<ESC>" }, -- shortcut for escape

    -- Move current line / block with Alt-j/k ala vscode.
    --[[ { "<A-j>", "<Esc>:m .+1<CR>==gi" },
    { "<A-k>", "<Esc>:m .-2<CR>==gi" }, ]]

    -- Terminal window navigation
    --[[ { "<C-h>", "<C-\\><C-N><C-w>h" },
    { "<C-j>", "<C-\\><C-N><C-w>j" },
    { "<C-k>", "<C-\\><C-N><C-w>k" },
    { "<C-l>", "<C-\\><C-N><C-w>l" }, ]]
  },
  n = { -- normal mode
    { ";", ":", { silent = false} }, -- use ; to enter command mode

    { "Q", "<nop>" }, -- disable Ex mode

    { "//", "<cmd>nohlsearch<cr>" }, -- clear highlights

    { "<C-h>", "<C-w>h" }, -- move left a window easier
    { "<C-j>", "<C-w>j" }, -- move down a window easier
    { "<C-k>", "<C-w>k" }, -- move up a window easier
    { "<C-l>", "<C-w>l" }, -- move right a window easier

    { "<S-Up>", "<cmd>resize -2<CR>" }, -- make current window smaller horizontally
    { "<S-Down>", "<cmd>resize +2<CR>" }, -- make current window bigger horizontally
    { "<S-Left>", "<cmd>vertical resize -2<CR>" }, -- make current window smaller vertically
    { "<S-Right>", "<cmd>vertical resize +2<CR>" }, -- make current window bigger vertically

    -- Move current line / block with Alt-j/k a la vscode.
    --[[ { "<A-j>", ":m .+1<CR>==" },
    { "<A-k>", ":m .-2<CR>==" }, ]]

    -- QuickFix
    { "]q", "<cmd>cnext<CR>" },
    { "[q", "<cmd>cprev<CR>" },

    -- { "<S-l>", "<cmd>bnext<CR>" }, -- move to next buffer
    -- { "<S-h>", "<cmd>bprevious<CR>" }, -- move to previous buffer

    { "<leader>w", "<cmd>update!<cr>", { silent = false } }, -- fast saving
    { "<leader>x", "<cmd>xit<cr>", { silent = false }  }, -- fast saving and quitting

    { ">", ">>_" }, -- easier adding indent on line
    { "<", "<<_" }, -- easier removing indent on line
  },
  t = { -- terminal mode
    { "<C-o>", [[<C-\><C-n><esc><cr>]] }, -- navigate terminal in normal mode

    -- Terminal window navigation
    --[[ { "<C-h>", "<C-\\><C-N><C-w>h" },
    { "<C-j>", "<C-\\><C-N><C-w>j" },
    { "<C-k>", "<C-\\><C-N><C-w>k" },
    { "<C-l>", "<C-\\><C-N><C-w>l" }, ]]
  },
  v = { -- visual/select mode
    { ";", ":", { silent = false} }, -- use ; to enter command mode

    { "<", "<gv" }, -- reselect visual selection after adding indent on line
    { ">", ">gv" }, -- reselect visual selection after removing indent on line
  },
  x = { -- visual mode
    { "K", ":move '<-2<CR>gv-gv" }, -- move selected line/block up => note, can't use <Cmd>
    { "J", ":move '>+1<CR>gv-gv" }, -- move selected line/block down => note, can't use <Cmd>

    -- Move current line / block with Alt-j/k ala vscode.
    --[[ { "<A-j>", ":m '>+1<CR>gv-gv" },
    { "<A-k>", ":m '<-2<CR>gv-gv" }, ]]
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

local telescope_mappings = {
  n = { -- normal mode
    { "<leader>f", "<cmd>Telescope find_files<cr>" },  -- find files
    { "<leader>ss", "<cmd>Telescope builtin<cr>" },  -- find telescope commands
    { "<leader>sr", "<cmd>Telescope oldfiles<cr>" },  -- find recent files
    { "<leader>sg", "<cmd>Telescope live_grep<cr>" },  -- find find with grep
    { "<leader>sb", "<cmd>Telescope buffers<cr>" },  -- find buffers
    { "<leader>st", "<cmd>Telescope tags<cr>" },  -- find tags
    { "<leader>sh", "<cmd>Telescope help_tags<cr>" },  -- find help tags
    { "<leader>sc", "<cmd>Telescope command_history<cr>" },  -- find command history
    { "<leader>sk", "<cmd>Telescope keymaps<cr>" },  -- find keymaps
    { "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>" },  -- find in current buffer
    { "<leader>gsc", "<cmd>Telescope git_commits<cr>" },  -- find git commits
    { "<leader>gsb", "<cmd>Telescope git_branches<cr>" },  -- find git branches
  }
}

local nvim_compe_mappings = {
  i = { -- insert mode
    { "<C-Space>", "compe#complete()", { expr = true } }, -- open completion menu
    { "<cr>", "compe#confirm('<CR>')", { expr = true } }, -- open completion menu
    { "<C-e>", "compe#close('<C-e>')", { expr = true} }, -- close the completion menu
    { "<Tab>", "v:lua.tab_complete()", { expr = true} }, -- tab to go to the next completion
    { "<S-Tab>", "v:lua.s_tab_complete()", { expr = true} }, -- shift-tab to go to the previous completion
  },
  s = {
    { "<Tab>", "v:lua.tab_complete()", { expr = true} }, -- tab to go to the next completion
    { "<S-Tab>", "v:lua.s_tab_complete()", { expr = true} }, -- shift-tab to go to the previous completion
  }
}

local vim_test_mappings = {
  n = { -- normal mode
    { "<leader>tn", "<cmd>TestNearest<cr>" },
    { "<leader>tf", "<cmd>TestFile<cr>" },
    { "<leader>ts", "<cmd>TestSuite<cr>" },
    { "<leader>tl", "<cmd>TestLast<cr>" },
    { "<leader>tv", "<cmd>TestVisit<cr>" },
  }
}
-- TODO eventually use ultest here when termcodes works??
-- utils.map('n', '<leader>tf', utils.t('<Plug>') .. '(ultest-run-file)', {noremap = false})
-- utils.map('n', '<leader>tf', vim.api.nvim_replace_termcodes('<Plug>(ultest-run-file)', true, true, true), {noremap = false})

local vim_projectionist_mappings = {
  n = { -- normal mode
    { "<leader>a", "<cmd>A<cr>" },
    { "<leader>va", "<cmd>AV<cr>" },
  }
}

local nvim_tree_mappings = {
  n = { -- normal mode
    -- { "<leader>e", "<cmd>NvimTreeToggle<cr>" },
    { "<leader>e", "<cmd>lua require 'config.nvim-tree'.toggle_tree()<CR>" },
    -- { "<leader>E", "<cmd>NvimTreeFindFile<cr>" },
  }
}

local barbar_mappings = {
  n = { -- normal mode
    { "<S-l>", "<cmd>BufferNext<cr>" }, -- go to next buffer
    { "<S-h>", "<cmd>BufferPrevious<cr>" }, -- go to previous buffer
    { "<leader>c", "<cmd>BufferClose<cr>" }, -- close buffer but keep window layout
    { "<leader>bj", "<cmd>BufferPick<cr>" }, -- jump to buffer
    { "<leader>be", "<cmd>BufferCloseAllButCurrent<cr>" }, -- close all but currenty buffer
    { "<leader>bh", "<cmd>BufferCloseBuffersLeft<cr>" }, -- close all buffers to the left
    { "<leader>bl", "<cmd>BufferCloseBuffersRight<cr>" }, -- close all buffers to the right
    -- { "<leader>bs", "<cmd>Telescope buffers<cr>" }, -- find buffers
    { "<leader>bD", "<cmd>BufferOrderByDirectory<cr>" }, -- sort by directory
    { "<leader>bL", "<cmd>BufferOrderByLanguage<cr>" }, -- sort by language
  }
}

utils.register_mappings(default_mappings)
utils.register_mappings(fugitive_mappings)
utils.register_mappings(telescope_mappings)
utils.register_mappings(nvim_compe_mappings)
utils.register_mappings(vim_test_mappings)
utils.register_mappings(vim_projectionist_mappings)
utils.register_mappings(nvim_tree_mappings)
utils.register_mappings(barbar_mappings)

--[[
  nvim-bufdel
]]
--[[ utils.map('n', '<leader>q', '<cmd>BufDel<CR>'); -- delete the current buffer while maintaining window layout
utils.map('n', '<leader>x', '<cmd>w<cr><cmd>BufDel<cr>') -- Fast saving and quitting a buffer while maintaining window layout ]]

-- vim.cmd 'inoremap <expr> <c-j> ("\\<C-n>")'
-- vim.cmd 'inoremap <expr> <c-k> ("\\<C-p>")'
-- vim.cmd('inoremap <expr> <TAB> (\"\\<C-n>\")')
-- vim.cmd('inoremap <expr> <S-TAB> (\"\\<C-p>\")')
