return {
	'WhoIsSethDaniel/mason-tool-installer.nvim',
	dependencies = { 'williamboman/mason.nvim' },
	opts = {
		ensure_installed = {
			'beautysh',
			'clang-format',
			'hadolint',
			'markdownlint-cli2',
			'markdown-toc',
			'prettierd',
			'stylua',
			'sqruff',
		},
	},
}
