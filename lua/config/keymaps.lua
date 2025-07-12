-- Buffer navigation
vim.keymap.set('n', ']b', '<cmd>bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '[b', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })

-- Clipboard and register management
vim.keymap.set('x', '<leader>p', '"_dP', { desc = 'Paste without overwriting register' })
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
vim.keymap.set('n', '<leader>Y', '"+Y', { desc = 'Yank line to system clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete to void register' })

-- Diagnostics
vim.keymap.set('n', '<leader>xl', function()
	if vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 then
		vim.cmd.lclose()
	else
		vim.diagnostic.setloclist()
		vim.cmd.lopen()
	end
end, { desc = 'Toggle diagnostics' })
vim.keymap.set('n', '[D', function()
	vim.diagnostic.jump({ count = -math.huge })
end, { desc = 'First diagnostic' })
vim.keymap.set('n', ']D', function()
	vim.diagnostic.jump({ count = math.huge })
end, { desc = 'Last diagnostic' })

-- Formatting and utility
vim.keymap.set('n', 'Q', '<nop>', { desc = 'Disable Ex mode' })

-- Indenting
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left and reselect' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right and reselect' })

-- Location list navigation
vim.keymap.set('n', ']l', '<cmd>lnext<CR>zz', { desc = 'Next location item, center' })
vim.keymap.set('n', '[l', '<cmd>lprev<CR>zz', { desc = 'Prev location item, center' })
vim.keymap.set('n', ']L', '<cmd>llast<CR>zz', { desc = 'Last location item, center' })
vim.keymap.set('n', '[L', '<cmd>lfirst<CR>zz', { desc = 'First location item, center' })

-- Move lines up/down with Alt+j/k (works across all modes)
local move_opts = { noremap = true, silent = true }
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', vim.tbl_extend('force', move_opts, { desc = 'Move line down' }))
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', vim.tbl_extend('force', move_opts, { desc = 'Move line up' }))
vim.keymap.set('i', '<A-j>', '<Esc>:m .+1<CR>==gi', vim.tbl_extend('force', move_opts, { desc = 'Move line down' }))
vim.keymap.set('i', '<A-k>', '<Esc>:m .-2<CR>==gi', vim.tbl_extend('force', move_opts, { desc = 'Move line up' }))
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", vim.tbl_extend('force', move_opts, { desc = 'Move selection down' }))
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", vim.tbl_extend('force', move_opts, { desc = 'Move selection up' }))

-- Navigation and scrolling improvements
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join lines without moving cursor' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Page down and center cursor' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Page up and center cursor' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result, center and unfold' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Prev search result, center and unfold' })
vim.keymap.set('n', '=ap', "ma=ap'a", { desc = 'Format paragraph and restore cursor' })

-- Quickfix and location list navigation
vim.keymap.set('n', ']q', '<cmd>cnext<CR>zz', { desc = 'Next quickfix item, center' })
vim.keymap.set('n', '[q', '<cmd>cprev<CR>zz', { desc = 'Prev quickfix item, center' })
vim.keymap.set('n', ']Q', '<cmd>clast<CR>zz', { desc = 'Last quickfix item, center' })
vim.keymap.set('n', '[Q', '<cmd>cfirst<CR>zz', { desc = 'First quickfix item, center' })

-- Text manipulation
vim.keymap.set(
	'n',
	'<leader>s',
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = 'Search and replace word under cursor' }
)
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Make current file executable' })

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to down window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to up window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })
