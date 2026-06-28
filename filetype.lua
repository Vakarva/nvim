local helm_template = function(path)
    local chart = vim.fs.find('Chart.yaml', {
        path = vim.fs.dirname(path),
        upward = true,
    })[1]

    if not chart then
        return nil
    end

    local chart_dir = vim.fs.dirname(chart)
    if vim.startswith(path, chart_dir .. '/templates/') then
        return 'helm'
    end
end

vim.filetype.add({
    pattern = {
        ['.*/templates/.*%.ya?ml'] = { helm_template, { priority = 100 } },
    },
})
