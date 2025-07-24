-- Display Settings
vim.opt.colorcolumn = '120' -- Visual guide at 100 characters (modern default)
vim.opt.nu = true -- Show absolute line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.signcolumn = 'yes' -- Always show sign column
vim.opt.wrap = false -- Don't wrap long lines

-- File & Buffer Management
vim.opt.backup = false -- Don't create backup files
vim.opt.isfname:append('@-@') -- Include @ and - in filenames
vim.opt.swapfile = false -- Don't create swap files
vim.opt.undofile = true -- Persistent undo across sessions

-- Indentation & Spacing
vim.opt.autoindent = true -- Copy indent from current line
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.shiftwidth = 4 -- Spaces for each indentation level
vim.opt.smartindent = true -- Smart autoindenting for new lines
vim.opt.softtabstop = 4 -- Spaces per tab in insert mode
vim.opt.tabstop = 4 -- Visual spaces per tab character

-- Leader Keys
vim.g.mapleader = ' ' -- Space as primary leader key
vim.g.maplocalleader = '\\' -- Backslash as local leader key

-- Scroll & Navigation
vim.opt.scrolloff = 8 -- Keep 8 lines visible above/below cursor
vim.opt.updatetime = 50 -- Faster completion and updates (ms)

-- Search Configuration
vim.opt.hlsearch = false -- Don't highlight search results
vim.opt.incsearch = true -- Show matches while typing search

-- Windows
vim.opt.splitright = true -- New vertical splits open to the right
vim.opt.splitbelow = true -- New horizontal splits open below
vim.api.nvim_create_autocmd('BufWinEnter', {
	pattern = '*',
	callback = function()
		if vim.bo.buftype == 'help' then
			vim.cmd('wincmd L')
		end
	end,
	desc = 'Move help windows to the right side',
})

-- Filetype-Specific Settings
-- Git commit messages: 50-character subject, 72-character body
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'gitcommit',
	callback = function()
		vim.opt_local.colorcolumn = '51,73'
		vim.opt_local.textwidth = 72
	end,
	desc = 'Git commit message formatting (50/72 rule)',
})

-- Python: Follow Ruff formatter standard
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'python',
	callback = function()
		vim.opt_local.colorcolumn = '88'
	end,
	desc = 'Python Ruff formatter line length',
})
