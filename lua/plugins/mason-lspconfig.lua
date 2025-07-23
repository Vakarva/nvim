return {
	'mason-org/mason-lspconfig.nvim',
	dependencies = {
		'mason-org/mason.nvim',
	},
	opts = {
		ensure_installed = {
			'basedpyright',
			'bashls',
			'biome',
			'css_variables',
			'cssls',
			'cssmodules_ls',
			'docker_compose_language_service',
			'dockerls',
			'html',
			'jsonls',
			'lua_ls',
			'marksman',
			'postgres_lsp',
			'ruff',
			'vtsls',
			'yamlls',
		},
	},
}
