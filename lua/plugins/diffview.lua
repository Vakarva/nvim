return {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewFileHistory' },
    keys = {
        { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'Diff View (working tree)' },
        { '<leader>gf', '<cmd>DiffviewFileHistory %<cr>', desc = 'File History (current file)' },
        { '<leader>gF', '<cmd>DiffviewFileHistory<cr>', desc = 'File History (branch)' },
    },
}
