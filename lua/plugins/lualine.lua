return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		options = {
			component_separators = { left = '', right = '' },
			section_separators = { left = '', right = '' },
		},
		sections = {
			lualine_c = {
				{
					'filename',
					file_status = true,
					path = 1,
					shorting_target = 50,
				},
				{
					'aerial',
					sep = ' ',
					sep_icon = '',
					depth = 5,
					dense = false,
					dense_sep = '.',
					colored = true,
				},
			},
		},
	},
}
