return {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = {
		'.git',
		'.luacheckrc',
		'.luarc.json',
		'.luarc.jsonc',
		'.stylua.toml',
		'selene.toml',
		'selene.yml',
		'stylua.toml',
	},
	settings = {
		Lua = {
			workspace = {
				checkThirdParty = false,
			},
			codeLens = {
				enable = true,
			},
			completion = {
				callSnippet = 'Replace',
			},
			doc = {
				privateName = { '^_' },
			},
			hint = {
				enable = true,
				setType = false,
				paramType = true,
				paramName = 'Disable',
				semicolon = 'Disable',
				arrayIndex = 'Disable',
			},
		},
	},
}
