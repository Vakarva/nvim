return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'mason-org/mason-lspconfig.nvim',
		'hrsh7th/cmp-nvim-lsp',
		'j-hui/fidget.nvim',
	},
	config = function()
		local lspconfig_defaults = require('lspconfig').util.default_config
		lspconfig_defaults.capabilities = vim.tbl_deep_extend(
			'force',
			lspconfig_defaults.capabilities,
			require('cmp_nvim_lsp').default_capabilities()
		)

		local lspconfig = require('lspconfig')
		lspconfig.bashls.setup({})
		lspconfig.cssls.setup({})
		lspconfig.docker_compose_language_service.setup({
			filetypes = { 'yaml.docker-compose', 'yaml' },
		})
		lspconfig.dockerls.setup({})
		lspconfig.html.setup({})
		lspconfig.jsonls.setup({})
		lspconfig.lua_ls.setup({})
		lspconfig.pyright.setup({})
		lspconfig.vtsls.setup({
			settings = {
				complete_function_calls = true,
				vtsls = {
					enableMoveToFileCodeAction = true,
					autoUseWorkspaceTsdk = true,
					experimental = {
						completion = {
							enableServerSideFuzzyMatch = true,
						},
					},
				},
				typescript = {
					updateImportsOnFileMove = { enabled = 'always' },
					suggest = { completeFunctionCalls = true },
				},
			},
		})
		lspconfig.yamlls.setup({})

		vim.api.nvim_create_autocmd('LspAttach', {
			callback = function(e)
				local opts = { buffer = e.buf }
				vim.keymap.set('n', 'grr', function()
					require('telescope.builtin').lsp_references()
				end, vim.tbl_extend('force', opts, { desc = 'Find References (Telescope)' }))
				vim.keymap.set('n', '<leader>ws', function()
					require('telescope.builtin').lsp_dynamic_workspace_symbols()
				end, vim.tbl_extend('force', opts, { desc = 'Dynamic Workspace Symbols' }))
				vim.keymap.set(
					'n',
					'<leader>ds',
					'<cmd>Telescope lsp_document_symbols<cr>',
					vim.tbl_extend('force', opts, { desc = 'Document Symbols' })
				)
			end,
		})

		vim.diagnostic.config({
			float = {
				focusable = false,
				style = 'minimal',
				border = 'rounded',
				source = 'if_many',
				header = '',
				prefix = '',
			},
		})
	end,
}
