return {
	'WhoIsSethDaniel/mason-tool-installer.nvim',
	dependencies = { 'williamboman/mason.nvim' },
	opts = {
		ensure_installed = {
			'hadolint',
			'prettierd',
			'ruff',
			'stylua',
			'sqruff',
		},
	},
}
