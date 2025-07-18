return {
	'stevearc/aerial.nvim',
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
		'nvim-tree/nvim-web-devicons',
	},
	keys = {
		{ '<leader>a', '<cmd>AerialToggle<cr>', desc = 'Aerial (Symbols)' },
	},
	opts = {
		attach_mode = 'global',
		backends = { 'lsp', 'treesitter', 'markdown', 'man' },
		layout = {
			default_direction = 'left',
			placement = 'edge',
			win_opts = {
				winhl = 'Normal:NormalFloat,FloatBorder:NormalFloat,SignColumn:SignColumnSB',
				signcolumn = 'yes',
				statuscolumn = ' ',
			},
		},
		filter_kind = {
			-- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#symbolKind
			'Array',
			'Boolean',
			'Class',
			'Constant',
			'Constructor',
			'Enum',
			'EnumMember',
			'Event',
			'Field',
			'File',
			'Function',
			'Interface',
			'Method',
			'Module',
			'Namespace',
			'Null',
			'Number',
			'Object',
			'Package',
			'Property',
			'String',
			'Struct',
			'Variable',
		},
		guides = {
			mid_item = '├╴',
			last_item = '└╴',
			nested_top = '│ ',
			whitespace = '  ',
		},
		on_attach = function(bufnr)
			vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
			vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
		end,
		show_guides = true,
	},
}
