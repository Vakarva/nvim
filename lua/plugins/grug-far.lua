return {
    'MagicDuck/grug-far.nvim',
    cmd = 'GrugFar',
    opts = {},
    keys = {
        {
            '<leader>sr',
            function()
                -- Prefill a filter for the current file's extension; clear it in the UI to search everything
                local ext = vim.bo.buftype == '' and vim.fn.expand('%:e')
                require('grug-far').open({
                    transient = true,
                    prefills = {
                        filesFilter = ext and ext ~= '' and '*.' .. ext or nil,
                    },
                })
            end,
            desc = 'Search and Replace',
        },
        {
            '<leader>sr',
            function()
                require('grug-far').with_visual_selection({ transient = true })
            end,
            mode = 'v',
            desc = 'Search and Replace (selection)',
        },
    },
}
