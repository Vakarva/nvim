local commit_colorcolumn = '51,73'

vim.opt_local.colorcolumn = commit_colorcolumn
vim.opt_local.textwidth = 72

local group = vim.api.nvim_create_augroup('user_gitcommit_colorcolumn', { clear = false })

vim.api.nvim_clear_autocmds({ group = group, buffer = 0 })
vim.api.nvim_create_autocmd({ 'BufWinEnter', 'WinEnter' }, {
    group = group,
    buffer = 0,
    desc = 'Show git commit message length guides',
    callback = function()
        vim.wo.colorcolumn = commit_colorcolumn
    end,
})
