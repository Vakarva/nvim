return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		options = {
			theme = 'dracula',
		},
		sections = {
			lualine_c = {
				{
					'filename',
					file_status = true,
					path = 1,
					shorting_target = 50,
				},
			},
		},
	},
}
