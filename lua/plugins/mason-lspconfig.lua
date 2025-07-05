return {
    'mason-org/mason-lspconfig.nvim',
    opts = {
        ensure_installed = {
            'bashls',
            'cssls',
            'eslint',
            'html',
            'jsonls',
            'lua_ls',
            'pyright',
            'ts_ls',
            'yamlls',
        },
    },
    dependencies = {
        { 'mason-org/mason.nvim', opts = {} },
        'neovim/nvim-lspconfig',
    },
}
