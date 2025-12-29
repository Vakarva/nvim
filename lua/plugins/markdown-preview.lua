return {
    'iamcco/markdown-preview.nvim',
    build = function()
        vim.fn['mkdp#util#install']()
    end,
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    config = function()
        vim.cmd([[do FileType]])
    end,
    keys = {
        { '<leader>mp', ft = 'markdown', '<CMD>MarkdownPreviewToggle<CR>', desc = 'Markdown Preview toggle' },
    },
}
