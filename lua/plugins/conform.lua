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
			['markdown-toc'] = {
				condition = function(_, ctx)
					for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
						if line:find('<!%-%- toc %-%->') then
							return true
						end
					end
				end,
			},
			['markdownlint-cli2'] = {
				condition = function(_, ctx)
					local diag = vim.tbl_filter(function(d)
						return d.source == 'markdownlint'
					end, vim.diagnostic.get(ctx.buf))
					return #diag > 0
				end,
			},
		},
		formatters_by_ft = {
			['*'] = { 'trim_whitespace' },
			bash = { 'beautysh' },
			c = { 'clang-format' },
			css = { 'biome' },
			html = { 'biome' },
			javascript = { 'biome', 'biome-organize-imports' },
			javascriptreact = { 'biome', 'biome-organize-imports' },
			json = { 'biome' },
			jsonc = { 'biome' },
			lua = { 'stylua' },
			markdown = { 'prettierd', 'markdownlint-cli2', 'markdown-toc' },
			['markdown.mdx'] = { 'prettierd', 'markdownlint-cli2', 'markdown-toc' },
			python = { 'ruff_fix', 'ruff_organize_imports', 'ruff_format' },
			rust = { 'rustfmt' },
			sql = { 'sqruff' },
			typescript = { 'biome', 'biome-organize-imports' },
			typescriptreact = { 'biome', 'biome-organize-imports' },
			yaml = { 'prettierd' },
			zig = { 'zigfmt' },
		},
	},
}
