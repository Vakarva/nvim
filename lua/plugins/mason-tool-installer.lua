return {
	'WhoIsSethDaniel/mason-tool-installer.nvim',
	dependencies = { 'williamboman/mason.nvim' },
	opts = {
		ensure_installed = {
			'beautysh',
			'hadolint',
			'markdownlint-cli2',
			'markdown-toc',
			'prettierd',
			'stylua',
			'sqruff',
		},
	},
}
