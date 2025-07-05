return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { '<leader>fd', '<cmd>Telescope find_files<cr>', desc = 'Telescope find files' },
        { '<C-f>', '<cmd>Telescope git_files<cr>', desc = 'Telescope find git files' },
        { '<leader>fg', function()
            require('telescope.builtin').grep_string({ search = vim.fn.input('Grep > ') })
        end, desc = 'Telescope project search' }
    }
}
