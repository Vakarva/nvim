return {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local lint = require('lint')

        lint.linters_by_ft = {
            dockerfile = { 'hadolint' },
            markdown = { 'markdownlint-cli2' },
            rust = { 'clippy' },
        }

        local markdownlint = lint.linters['markdownlint-cli2']
        markdownlint.args =
            vim.list_extend(markdownlint.args or {}, { '--config', vim.fn.stdpath('config') .. '/.markdownlint.jsonc' })

        local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
        vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
