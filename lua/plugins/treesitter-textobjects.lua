return {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    config = function()
        require('nvim-treesitter-textobjects').setup({
            move = {
                set_jumps = true,
            },
            select = {
                lookahead = true,
                selection_modes = {
                    ['@parameter.outer'] = 'v', -- charwise
                    ['@function.outer'] = 'V', -- linewise
                    ['@class.outer'] = '<c-v>', -- blockwise
                },
                include_surrounding_whitespace = false,
            },
        })
    end,
    keys = function()
        -- Defer the requires to keypress time so registering the keymaps
        -- at startup doesn't load the plugin
        local function swap(fn, textobject)
            return function()
                require('nvim-treesitter-textobjects.swap')[fn](textobject)
            end
        end
        local function move(fn, textobject, query_group)
            return function()
                require('nvim-treesitter-textobjects.move')[fn](textobject, query_group)
            end
        end
        local function repeat_move(fn)
            return function()
                return require('nvim-treesitter-textobjects.repeatable_move')[fn]()
            end
        end
        local nxo = { 'n', 'x', 'o' }

        return {
            { '<leader>a', swap('swap_next', '@parameter.inner'), mode = 'n' },
            { '<leader>A', swap('swap_previous', '@parameter.inner'), mode = 'n' },
            { ']m', move('goto_next_start', '@function.outer', 'textobjects'), mode = nxo },
            { ']]', move('goto_next_start', '@class.outer', 'textobjects'), mode = nxo },
            { ']o', move('goto_next_start', { '@loop.inner', '@loop.outer' }, 'textobjects'), mode = nxo },
            { ']s', move('goto_next_start', '@local.scope', 'locals'), mode = nxo },
            { ']z', move('goto_next_start', '@fold', 'folds'), mode = nxo },
            { ']M', move('goto_next_end', '@function.outer', 'textobjects'), mode = nxo },
            { '][', move('goto_next_end', '@class.outer', 'textobjects'), mode = nxo },
            { '[m', move('goto_previous_start', '@function.outer', 'textobjects'), mode = nxo },
            { '[[', move('goto_previous_start', '@class.outer', 'textobjects'), mode = nxo },
            { '[M', move('goto_previous_end', '@function.outer', 'textobjects'), mode = nxo },
            { '[]', move('goto_previous_end', '@class.outer', 'textobjects'), mode = nxo },
            -- Repeat movement with ; and ,
            { ';', repeat_move('repeat_last_move'), mode = nxo },
            { ',', repeat_move('repeat_last_move_opposite'), mode = nxo },
            -- Make builtin f, F, t, T repeatable with ; and ,
            { 'f', repeat_move('builtin_f_expr'), mode = nxo, expr = true },
            { 'F', repeat_move('builtin_F_expr'), mode = nxo, expr = true },
            { 't', repeat_move('builtin_t_expr'), mode = nxo, expr = true },
            { 'T', repeat_move('builtin_T_expr'), mode = nxo, expr = true },
        }
    end,
}
