local is_spec = require('util.openapi').is_spec

return {
    cmd = { 'openapi-language-server' },
    filetypes = { 'yaml', 'json' },
    root_dir = function(bufnr, on_dir)
        if not is_spec(bufnr) then
            return
        end
        local fname = vim.api.nvim_buf_get_name(bufnr)
        on_dir(vim.fs.root(fname, { 'contracts', '.git' }) or vim.fs.dirname(fname))
    end,
}
