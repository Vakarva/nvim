return {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local lint = require('lint')

        -- True if the buffer looks like an OpenAPI/Swagger doc
        -- (top-level `openapi:` / `swagger:` key near the top)
        local function is_spec(bufnr)
            for _, line in ipairs(vim.api.nvim_buf_get_lines(bufnr, 0, 20, false)) do
                if line:match('^%s*"?openapi"?%s*:') or line:match('^%s*"?swagger"?%s*:') then
                    return true
                end
            end
            return false
        end

        lint.linters_by_ft = {
            dockerfile = { 'hadolint' },
            markdown = { 'markdownlint-cli2' },
            rust = { 'clippy' },
            terraform = { 'tflint', 'trivy' },
        }

        local markdownlint = lint.linters['markdownlint-cli2']
        markdownlint.args =
            vim.list_extend(markdownlint.args or {}, { '--config', vim.fn.stdpath('config') .. '/.markdownlint.jsonc' })

        local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
        vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
                if vim.bo.filetype == 'yaml' and is_spec(0) then
                    lint.try_lint('vacuum')
                end
            end,
        })
    end,
}
