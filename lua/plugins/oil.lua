return {
	'stevearc/oil.nvim',
	---@module 'oil'
	---@type oil.SetupOpts
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
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
		delete_to_trash = true,
		keymaps = {
			['<C-h>'] = false,
			['<C-l>'] = false,
		},
		view_options = {
			is_hidden_file = function(name, _)
				local folder_skip = { '.git' }
				return vim.tbl_contains(folder_skip, name)
			end,
		},
		watch_for_changes = true,
		win_options = {
			signcolumn = 'yes:2',
		},
	},
}
