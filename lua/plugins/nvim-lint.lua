return {
	'mfussenegger/nvim-lint',
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		local lint = require('lint')

		lint.linters_by_ft = {
			python = { 'ruff' },
			javascript = { 'eslint_d' },
			typescript = { 'eslint_d' },
			javascriptreact = { 'eslint_d' },
			sql = { 'sqruff' },
			typescriptreact = { 'eslint_d' },
		}

		local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
		vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
