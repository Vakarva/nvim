return {
    'NeogitOrg/neogit',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'sindrets/diffview.nvim', -- optional but recommended
        'nvim-telescope/telescope.nvim', -- optional
    },
    config = true,
    keys = {
        { '<leader>gs', '<cmd>Neogit<cr>', desc = 'Neogit Status' }
    }
}
