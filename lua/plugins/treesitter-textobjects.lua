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
	init = function()
		vim.g.no_plugin_maps = true
	end,
	keys = function()
		local swap = require('nvim-treesitter-textobjects.swap')
		local move = require('nvim-treesitter-textobjects.move')
		local ts_repeat_move = require('nvim-treesitter-textobjects.repeatable_move')

		return {
			{
				'<leader>a',
				function()
					swap.swap_next('@parameter.inner')
				end,
				mode = 'n',
			},
			{
				'<leader>A',
				function()
					swap.swap_previous('@parameter.outer')
				end,
				mode = 'n',
			},
			{
				']m',
				function()
					move.goto_next_start('@function.outer', 'textobjects')
				end,
				mode = { 'n', 'x', 'o' },
			},
			{
				']]',
				function()
					move.goto_next_start('@class.outer', 'textobjects')
				end,
				mode = { 'n', 'x', 'o' },
			},
			{
				']o',
				function()
					move.goto_next_start({ '@loop.inner', '@loop.outer' }, 'textobjects')
				end,
				mode = { 'n', 'x', 'o' },
			},
			{
				']s',
				function()
					move.goto_next_start('@local.scope', 'locals')
				end,
				mode = { 'n', 'x', 'o' },
			},
			{
				']z',
				function()
					move.goto_next_start('@fold', 'folds')
				end,
				mode = { 'n', 'x', 'o' },
			},
			{
				']M',
				function()
					move.goto_next_end('@function.outer', 'textobjects')
				end,
				mode = { 'n', 'x', 'o' },
			},
			{
				'][',
				function()
					move.goto_next_end('@class.outer', 'textobjects')
				end,
				mode = { 'n', 'x', 'o' },
			},
			{
				'[m',
				function()
					move.goto_previous_start('@function.outer', 'textobjects')
				end,
				mode = { 'n', 'x', 'o' },
			},
			{
				'[[',
				function()
					move.goto_previous_start('@class.outer', 'textobjects')
				end,
				mode = { 'n', 'x', 'o' },
			},
			{
				'[M',
				function()
					move.goto_previous_end('@function.outer', 'textobjects')
				end,
				mode = { 'n', 'x', 'o' },
			},
			{
				'[]',
				function()
					move.goto_previous_end('@class.outer', 'textobjects')
				end,
				mode = { 'n', 'x', 'o' },
			},
			-- Repeat movement with ; and ,
			{
				';',
				function()
					ts_repeat_move.repeat_last_move()
				end,
				mode = { 'n', 'x', 'o' },
			},
			{
				',',
				function()
					ts_repeat_move.repeat_last_move_opposite()
				end,
				mode = { 'n', 'x', 'o' },
			},
			-- Make builtin f, F, t, T repeatable with ; and ,
			{
				'f',
				ts_repeat_move.builtin_f_expr,
				mode = { 'n', 'x', 'o' },
				expr = true,
			},
			{
				'F',
				ts_repeat_move.builtin_F_expr,
				mode = { 'n', 'x', 'o' },
				expr = true,
			},
			{
				't',
				ts_repeat_move.builtin_t_expr,
				mode = { 'n', 'x', 'o' },
				expr = true,
			},
			{
				'T',
				ts_repeat_move.builtin_T_expr,
				mode = { 'n', 'x', 'o' },
				expr = true,
			},
		}
	end,
}
