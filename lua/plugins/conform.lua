return {
	'stevearc/conform.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	keys = {
		{
			'<leader>gf',
			function()
				require('conform').format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})
			end,
			mode = { 'n', 'v' },
			desc = 'Format file or range (in visual mode)',
		},
	},
	opts = {
		formatters_by_ft = {
			css = { 'prettierd' },
			html = { 'prettierd' },
			javascript = { 'prettierd' },
			javascriptreact = { 'prettierd' },
			json = { 'prettierd' },
			lua = { 'stylua' },
			python = { 'ruff_fix', 'ruff_organize_imports', 'ruff_format' },
			sql = { 'sqruff' },
			typescript = { 'prettierd' },
			typescriptreact = { 'prettierd' },
			yaml = { 'prettierd' },
			['*'] = { 'trim_whitespace' },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
}
