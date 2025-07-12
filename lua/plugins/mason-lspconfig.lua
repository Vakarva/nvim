return {
	'mason-org/mason-lspconfig.nvim',
	dependencies = {
		'mason-org/mason.nvim',
	},
	opts = {
		automatic_enable = {
			exclude = { 'docker_compose_language_service', 'vtsls' },
		},
		ensure_installed = {
			'bashls',
			'cssls',
			'docker_compose_language_service',
			'dockerls',
			'html',
			'jsonls',
			'lua_ls',
			'postgres_lsp',
			'pyright',
			'vtsls',
			'yamlls',
		},
	},
}
