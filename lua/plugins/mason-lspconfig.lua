return {
	'mason-org/mason-lspconfig.nvim',
	dependencies = {
		'mason-org/mason.nvim',
		'neovim/nvim-lspconfig',
	},
	opts = {
		ensure_installed = {
			'bashls',
			'cssls',
			'docker_compose_language_service',
			'dockerls',
			'html',
			'jsonls',
			'lua_ls',
			'pyright',
			'vtsls',
			'yamlls',
		},
	},
}
