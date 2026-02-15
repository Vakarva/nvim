local servers = {
    'bashls',
    'biome',
    'clangd',
    'css_variables',
    'cssls',
    'cssmodules_ls',
    'docker_compose_language_service',
    'dockerls',
    'golangci_lint_ls',
    'gopls',
    'html',
    'jsonls',
    'lua_ls',
    'marksman',
    'nginx_language_server',
    'postgres_lsp',
    'ruff',
    'sqruff',
    'ty',
    'vtsls',
    'yamlls',
    'zls',
}

vim.lsp.config('gopls', {
    settings = {
        gopls = {
            gofumpt = true,
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
        },
    },
})

-- Load local server configurations
-- for _, f in pairs(vim.api.nvim_get_runtime_file('lsp/*.lua', true)) do
--     local server_name = vim.fn.fnamemodify(f, ':t:r')
--     table.insert(servers, server_name)
-- end

vim.lsp.enable(servers)

-- Organize imports via gopls before saving Go files.
-- Formatting (with gofumpt) is handled by conform's LSP fallback.
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*.go',
    callback = function(e)
        local params = {
            textDocument = vim.lsp.util.make_text_document_params(e.buf),
            range = vim.lsp.util.make_range_params(0, 'utf-16').range,
            context = { only = { 'source.organizeImports' }, diagnostics = {} },
        }
        local result = vim.lsp.buf_request_sync(e.buf, 'textDocument/codeAction', params, 3000)
        for cid, res in pairs(result or {}) do
            for _, action in pairs(res.result or {}) do
                if action.edit then
                    vim.lsp.util.apply_workspace_edit(action.edit, 'utf-16')
                end
                if action.command then
                    local client = vim.lsp.get_client_by_id(cid)
                    if client then
                        client:exec_cmd(action.command, { bufnr = e.buf })
                    end
                end
            end
        end
    end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(e)
        local keymapOpts = { buffer = e.buf }
        vim.keymap.set(
            'n',
            'gd',
            '<cmd>FzfLua lsp_definitions jump1=true ignore_current_line=true<cr>',
            vim.tbl_extend('force', keymapOpts, { desc = 'Goto Definition' })
        )

        vim.keymap.set(
            'n',
            'grr',
            '<cmd>FzfLua lsp_references jump1=true ignore_current_line=true<cr>',
            vim.tbl_extend('force', keymapOpts, { desc = 'Find References', nowait = true })
        )

        vim.keymap.set(
            'n',
            'gI',
            '<cmd>FzfLua lsp_implementations jump1=true ignore_current_line=true<cr>',
            vim.tbl_extend('force', keymapOpts, { desc = 'Goto Implementation' })
        )

        vim.keymap.set(
            'n',
            'gy',
            '<cmd>FzfLua lsp_typedefs jump1=true ignore_current_line=true<cr>',
            vim.tbl_extend('force', keymapOpts, { desc = 'Goto Type Definition' })
        )
    end,
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
