return {
	'saghen/blink.cmp',
	dependencies = { 'rafamadriz/friendly-snippets' },
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		appearance = { nerd_font_variant = 'mono' },
		completion = { documentation = { auto_show = false } },
		fuzzy = { implementation = 'prefer_rust_with_warning' },
		keymap = { preset = 'default' },
		sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
	},
	opts_extend = { 'sources.default' },
	version = '1.*',
}
