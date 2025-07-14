return {
	'stevearc/oil.nvim',
	---@module 'oil'
	---@type oil.SetupOpts
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	keys = {
		{ '-', '<CMD>Oil<CR>', desc = 'Open parent directory' },
		{
			'<leader>-',
			function()
				require('oil').toggle_float()
			end,
			desc = 'Toggle oil floating window',
		},
	},
	lazy = false,
	opts = {
		keymaps = {
			['<C-h>'] = false,
			['<C-l>'] = false,
		},
		view_options = {
			show_hidden = true,
			is_always_hidden = function(name, _)
				local folder_skip = { '.git' }
				return vim.tbl_contains(folder_skip, name)
			end,
		},
		win_options = {
			signcolumn = 'yes:2',
		},
	},
}
