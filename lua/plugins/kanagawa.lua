return {
    'rebelot/kanagawa.nvim',
    config = function()
        require('kanagawa').setup({
            colors = {
                palette = {
                    dragonBlack0 = '#000000',
                    dragonBlack3 = '#151210',
                },
            },
        })
        vim.cmd.colorscheme('kanagawa-dragon')
    end,
    lazy = false,
    priority = 1000,
}
