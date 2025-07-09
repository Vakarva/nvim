local servers = {
    'bashls',
    'cssls',
    'eslint',
    'html',
    'jsonls',
    'lua_ls',
    'pyright',
    'ts_ls',
    'yamlls',
}

return {
    {
        'mason-org/mason-lspconfig.nvim',
        dependencies = {
            'mason-org/mason.nvim',
            'neovim/nvim-lspconfig',
        },
        opts = {
            ensure_installed = servers,
        }
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'mason-org/mason-lspconfig.nvim',
            'hrsh7th/cmp-nvim-lsp',
            'j-hui/fidget.nvim',
        },
        config = function()
            local cmp_lsp = require('cmp_nvim_lsp')
            local capabilities = vim.tbl_deep_extend(
                'force',
                {},
                vim.lsp.protocol.make_client_capabilities(),
                cmp_lsp.default_capabilities()
            )

            local lspconfig = require('lspconfig')

            for _, server in ipairs(servers) do
                lspconfig[server].setup({
                    capabilities = capabilities,
                })
            end

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = { globals = { 'vim' } }
                    }
                }
            })

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(e)
                    local opts = { buffer = e.buf }
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
                    vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
                    vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
                    vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
                end
            })

            vim.diagnostic.config({
                float = {
                    focusable = false,
                    style = 'minimal',
                    border = 'rounded',
                    source = 'if_many',
                    header = '',
                    prefix = '',
                },
            })
        end
    }
}
