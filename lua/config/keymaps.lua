-- Move lines up/down in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', 'K', ":m ,'<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Navigation and scrolling improvements
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join lines without moving cursor' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Page down and center cursor'})
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Page up and center cursor'})
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result, center and unfold' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Prev search result, center and unfold' })
vim.keymap.set('n', '=ap', "ma=ap'a", { desc = 'Format paragraph and restore cursor' })

-- Clipboard and register management
vim.keymap.set('x', '<leader>p', '"_dP', { desc = 'Paste without overwriting register'})
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y', { desc = 'Yank to system clipboard'})
vim.keymap.set('n', '<leader>Y', '"+Y', { desc = 'Yank line to system clipboard'})
vim.keymap.set({'n', 'v'}, '<leader>d', '"_d', { desc = 'Delete to void register'})

-- Formatting and utility
vim.keymap.set('n', 'Q', '<nop>', { desc = 'Disable Ex mode' })
vim.keymap.set({'n', 'v'}, '<leader>f', function()
    require("conform").format({ bufnr = 0 })
end, { desc = 'Format buffer with conform' })

-- Quickfix and location list navigation
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz', { desc = 'Next quickfix item, center' })
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz', { desc = 'Prev quickfix item, center' })
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz', { desc = 'Next location item, center' })
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz', { desc = 'Prev location item, center' })

-- Text manipulation
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Search and replace word under cursor' })
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Make current file executable' })
