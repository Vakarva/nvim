return {
	'mason-org/mason-lspconfig.nvim',
	dependencies = {
		'mason-org/mason.nvim',
	},
	opts = {
		ensure_installed = {
			'basedpyright',
			'bashls',
			'cssls',
			'docker_compose_language_service',
			'dockerls',
			'html',
			'jsonls',
			'lua_ls',
			'postgres_lsp',
			'vtsls',
			'yamlls',
		},
	},
}
