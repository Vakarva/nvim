local M = {}

-- True if the buffer looks like an OpenAPI/Swagger doc
-- (top-level `openapi:` / `swagger:` key near the top)
function M.is_spec(bufnr)
    for _, line in ipairs(vim.api.nvim_buf_get_lines(bufnr, 0, 20, false)) do
        if line:match('^%s*"?openapi"?%s*:') or line:match('^%s*"?swagger"?%s*') then
            return true
        end
    end
    return false
end

return M
