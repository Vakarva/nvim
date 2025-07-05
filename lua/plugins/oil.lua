return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    keys = {
        { '-', '<CMD>Oil<CR>', desc = 'Open parent directory' },
        { '<leader>-', function() require('oil').toggle_float() end,
        desc = 'Toggle oil floating window' },
    },
    opts = {
        view_options = {
            show_hidden = true,
            is_always_hidden = function(name, _)
                local folder_skip = { '.git' }
                return vim.tbl_contains(folder_skip, name)
            end,
        }
    },
    -- Optional dependencies
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
}
