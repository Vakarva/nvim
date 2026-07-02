local keys = {
    {
        '<leader>ha',
        function()
            require('harpoon'):list():add()
        end,
        desc = 'Harpoon add file',
    },
    {
        '<C-e>',
        function()
            local harpoon = require('harpoon')
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = 'Harpoon quick menu',
    },
    {
        '<leader>hp',
        function()
            require('harpoon'):list():prev()
        end,
        desc = 'Harpoon prev',
    },
    {
        '<leader>hn',
        function()
            require('harpoon'):list():next()
        end,
        desc = 'Harpoon next',
    },
}

for i = 1, 4 do
    table.insert(keys, {
        '<leader>' .. i,
        function()
            require('harpoon'):list():select(i)
        end,
        desc = 'Harpoon to file ' .. i,
    })
end

return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = keys,
    opts = {
        default = {
            -- Like the default select, but escapes special characters in the path
            select = function(list_item)
                if list_item == nil then
                    return
                end
                vim.cmd.edit(vim.fn.fnameescape(list_item.value))
                local ctx = list_item.context
                if ctx and ctx.row then
                    pcall(vim.api.nvim_win_set_cursor, 0, { ctx.row, ctx.col or 0 })
                end
            end,
        },
    },
}
