return {
	'nvim-treesitter/nvim-treesitter',
	branch = 'main',
	build = ':TSUpdate',
	config = function()
		local ts = require('nvim-treesitter')

		ts.install({
			'bash',
			'css',
			'csv',
			'diff',
			'dockerfile',
			'git_config',
			'git_rebase',
			'gitattributes',
			'gitcommit',
			'gitignore',
			'graphql',
			'html',
			'http',
			'javascript',
			'jsdoc',
			'json',
			'jsonc',
			'json5',
			'lua',
			'luadoc',
			'luap',
			'make',
			'markdown',
			'markdown_inline',
			'nginx',
			'ninja',
			'pem',
			'python',
			'query',
			'regex',
			'rst',
			'rust',
			'scss',
			'ssh_config',
			'sql',
			'toml',
			'tsx',
			'typescript',
			'vim',
			'vimdoc',
			'xml',
			'yaml',
			'zig',
		})

		local group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true })

		local ignore_filetypes = {
			'checkhealth',
			'lazy',
			'mason',
		}

		-- Auto-install parsers and enable highlighting on FileType
		vim.api.nvim_create_autocmd('FileType', {
			group = group,
			desc = 'Enable treesitter highlighting and indentation',
			callback = function(event)
				if vim.tbl_contains(ignore_filetypes, event.match) then
					return
				end

				local lang = vim.treesitter.language.get_lang(event.match) or event.match
				local buf = event.buf

				-- Start highlighting immediately (works if parser exists)
				pcall(vim.treesitter.start, buf, lang)

				-- Enable treesitter indentation
				vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

				-- Install missing parsers (async, no-op if already installed)
				ts.install({ lang })
			end,
		})
	end,
	lazy = false,
}
