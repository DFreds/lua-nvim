local utils = require "utils"

vim.g.dashboard_disable_at_vimenter = 0
vim.g.dashboard_disable_statusline = 1

vim.g.dashboard_default_executive = "telescope"

vim.g.dashboard_custom_header = {
  "{___     {__{__         {__{__{__       {__",
  "{_ {__   {__ {__       {__ {__{_ {__   {___",
  "{__ {__  {__  {__     {__  {__{__ {__ { {__",
  "{__  {__ {__   {__   {__   {__{__  {__  {__",
  "{__   {_ {__    {__ {__    {__{__   {_  {__",
  "{__    {_ __     {____     {__{__       {__",
  "{__      {__      {__      {__{__       {__",
}

vim.g.dashboard_custom_section = {
  a = {
    description = { "  Find File                     " },
    command = "Telescope find_files",
  },
  b = {
    description = { "ﭯ  Recently Used Files           " },
    command = "Telescope oldfiles",
  },
  c = {
    description = { "  Find Word                     " },
    command = "Telescope live_grep",
  },
  d = {
    description = { "  Load Last Session for branch  " },
    command = "execute 'SessionLoad ' . GetUniqueSessionName()",
  },
}

utils.define_augroups {
  _dashboard = {
    {
      "VimLeavePre",
      "*",
      "silent",
      "execute",
      "'SessionSave ' . GetUniqueSessionName()"
    }
  }
}
