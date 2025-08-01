return {
	{
		'catppuccin/nvim',
		lazy = false,
		name = 'catppuccin',
		opts = {
			auto_integrations = true,
			flavour = 'mocha',
			integrations = {
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { 'undercurl' },
						hints = { 'undercurl' },
						warnings = { 'undercurl' },
						information = { 'undercurl' },
					},
				},
			},
		},
		priority = 1000,
		config = function(_, opts)
			require('catppuccin').setup(opts)
			vim.cmd.colorscheme('catppuccin')
		end,
	},
}
