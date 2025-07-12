return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'mason-org/mason-lspconfig.nvim',
		'hrsh7th/cmp-nvim-lsp',
		'j-hui/fidget.nvim',
	},
	config = function()
		vim.lsp.config('docker_compose_language_service', {
			filetypes = { 'yaml.docker-compose', 'yaml' },
		})
		vim.lsp.config('vtsls', {
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
		vim.lsp.enable({ 'docker_compose_language_service', 'vtsls' })

		vim.api.nvim_create_autocmd('LspAttach', {
			callback = function(e)
				local telescope = require('telescope.builtin')
				local keymapOpts = { buffer = e.buf }
				vim.keymap.set('n', 'gd', function()
					telescope.lsp_definitions({ reuse_win = true })
				end, keymapOpts, { desc = 'Goto Definition (Telescope)' })
				vim.keymap.set(
					'n',
					'gr',
					'<cmd>Telescope lsp_references<cr>',
					keymapOpts,
					{ desc = 'Find References (Telescope)', nowait = true }
				)
				vim.keymap.set('n', 'gI', function()
					telescope.lsp_implementations({ reuse_win = true })
				end, keymapOpts, { desc = 'Goto [I]mplementation (Telescope)' })
				vim.keymap.set('n', 'gy', function()
					telescope.lsp_type_definitions({ reuse_win = true })
				end, keymapOpts, { desc = 'Goto T[y]pe Definition (Telescope)' })
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
