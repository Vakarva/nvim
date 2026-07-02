-- Servers are enabled by mason-lspconfig's automatic_enable, which covers
-- everything installed through mason (mason-lspconfig or mason-tool-installer)
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

-- Organize imports via gopls before saving Go files.
-- Formatting (with gofumpt) is handled by conform's LSP fallback.
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*.go',
    callback = function(e)
        local client = vim.lsp.get_clients({ bufnr = e.buf, name = 'gopls' })[1]
        if not client then
            return
        end
        local params = {
            textDocument = vim.lsp.util.make_text_document_params(e.buf),
            range = vim.lsp.util.make_range_params(0, client.offset_encoding).range,
            context = { only = { 'source.organizeImports' }, diagnostics = {} },
        }
        local result = client:request_sync('textDocument/codeAction', params, 3000, e.buf)
        for _, action in pairs(result and result.result or {}) do
            if action.edit then
                vim.lsp.util.apply_workspace_edit(action.edit, client.offset_encoding)
            end
            if action.command then
                client:exec_cmd(action.command, { bufnr = e.buf })
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
