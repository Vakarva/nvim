return {
	'WhoIsSethDaniel/mason-tool-installer.nvim',
	dependencies = { 'williamboman/mason.nvim' },
	opts = {
		ensure_installed = {
			'eslint_d',
			'hadolint',
			'prettierd',
			'ruff',
			'stylua',
			'sqruff',
		},
	},
}
