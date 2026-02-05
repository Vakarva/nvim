return {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    opts = {
        ensure_installed = {
            'beautysh',
            'clang-format',
            'golangci-lint',
            'hadolint',
            'markdownlint-cli2',
            'markdown-toc',
            'prettierd',
            'stylua',
            'sqruff',
        },
    },
}
