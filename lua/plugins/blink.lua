return {
	'saghen/blink.cmp',
	dependencies = { 'kristijanhusak/vim-dadbod-completion', 'rafamadriz/friendly-snippets' },
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		appearance = { nerd_font_variant = 'mono' },
		completion = { documentation = { auto_show = false } },
		fuzzy = { implementation = 'prefer_rust_with_warning' },
		keymap = { preset = 'default' },
		sources = {
			default = { 'lsp', 'dadbod', 'path', 'snippets', 'buffer' },
			providers = {
				dadbod = { name = 'Dadbod', module = 'vim_dadbod_completion.blink' },
			},
		},
	},
	opts_extend = { 'sources.default' },
	version = '1.*',
}
