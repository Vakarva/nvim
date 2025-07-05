return {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    keys = {
        { '<leader>u', '<cmd>UndotreeToggle<cr>', desc = 'Toggle Undotree' },
    },
    config = function()
        -- Better layout
        vim.g.undotree_WindowLayout = 2
        vim.g.undotree_SplitWidth = 40
        vim.g.undotree_SetFocusWhenToggle = 1
    end,
}
