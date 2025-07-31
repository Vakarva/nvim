return {
	'WhoIsSethDaniel/mason-tool-installer.nvim',
	dependencies = { 'williamboman/mason.nvim' },
	opts = {
		ensure_installed = {
			'beautysh',
			'hadolint',
			'prettierd',
			'stylua',
			'sqruff',
		},
	},
}
