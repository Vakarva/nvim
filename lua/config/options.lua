-- Set leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Indentation settings
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.tabstop = 4           -- Number of spaces tabs count for
vim.opt.softtabstop = 4       -- Number of spaces tabs count for in insert mode
vim.opt.shiftwidth = 4        -- Size of an indent
vim.opt.smartindent = true    -- Smart autoindenting on new lines
vim.opt.autoindent = true     -- Copy indent from current line when starting new line
vim.opt.shiftround = true     -- Round indent to multiple of shiftwidth

-- System clipboard integration via OSC 52 (Neovim 0.10+ built-in)
-- Works in containers with terminals that support OSC 52 like Ghostty
vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}
