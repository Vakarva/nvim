return {
	'stevearc/conform.nvim',
	cmd = 'ConformInfo',
	dependencies = { 'mason.nvim' },
	event = { 'BufReadPre', 'BufNewFile' },
	keys = function()
		local conform = require('conform')
		return {
			{
				'<leader>cf',
				function()
					conform.format({ bufnr = vim.api.nvim_get_current_buf() })
				end,
				mode = { 'n', 'v' },
				desc = 'Format',
			},
			{
				'<leader>cF',
				function()
					conform.format({ formatters = { 'injected' }, timeout_ms = 3000 })
				end,
				mode = { 'n', 'v' },
				desc = 'Format injected languages',
			},
		}
	end,
	opts = {
		default_format_opts = {
			timeout_ms = 3000,
			async = false,
			quiet = false,
			lsp_format = 'fallback',
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		formatters = {
			injected = { options = { ignore_errors = true } },
		},
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
	},
}
