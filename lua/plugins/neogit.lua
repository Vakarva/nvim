return {
	'NeogitOrg/neogit',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'sindrets/diffview.nvim',
		'ibhagwan/fzf-lua',
	},
	config = true,
	keys = {
		{ '<leader>gn', '<cmd>Neogit<cr>', desc = 'Neogit Status' },
	},
}
