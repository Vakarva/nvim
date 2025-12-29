return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    keys = {
        { '<leader>mt', '<CMD>RenderMarkdown toggle<CR>', desc = 'Toggle RenderMarkdown' },
    },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        completions = { lsp = { enabled = true } },
        enabled = false,
    },
}
