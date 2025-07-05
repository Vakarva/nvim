return {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        require('conform').setup({
            formatters_by_ft = {
                css = { 'prettierd' },
                html = { 'prettierd' },
                javascript = { 'prettierd' },
                javascriptreact = { 'prettierd' },
                json = { 'prettierd' },
                lua = { 'stylua' },
                python = { 'ruff_fix', 'ruff_format', 'ruff_organize_imports' },
                typescript = { 'prettierd' },
                typescriptreact = { 'prettierd' },
                yaml = { 'prettierd' },
                ['*'] = { 'trim_whitespace' },
            },
            default_format_opts = {
                lsp_format = 'fallback',
            },
            format_on_save = {
                timeout_ms = 1000,
            },
        })

        vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
            require('conform').format()
        end)
    end
}
