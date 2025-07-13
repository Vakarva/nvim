return {
	'nvim-telescope/telescope.nvim',
	cmd = 'Telescope',
	config = function(_, opts)
		local telescope = require('telescope')
		telescope.setup(opts)
		telescope.load_extension('fzf')
	end,
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
		},
	},
	keys = {
		{ '<leader>fd', '<cmd>Telescope find_files<cr>', desc = 'Telescope find files' },
		{ '<C-f>', '<cmd>Telescope git_files<cr>', desc = 'Telescope find git files' },
		{ '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Telescope live grep search' },
		{ '<leader>fw', '<cmd>Telescope grep_string<cr>', desc = 'Telescope grep word under cursor' },
		{ '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Telescope buffers' },
		{ '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Telescope help tags' },
		{ '<leader>fr', '<cmd>Telescope oldfiles<cr>', desc = 'Telescope recent files' },
		{ '<leader>fc', '<cmd>Telescope colorscheme<cr>', desc = 'Telescope colorschemes' },
	},
	opts = {
		defaults = {
			default_text = '', -- bug that causes 'A' to prepopulate searches
		},
	},
	tag = '0.1.8',
}
