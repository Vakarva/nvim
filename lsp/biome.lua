return {
	cmd = function(dispatchers, config)
		local cmd = 'biome'
		local local_cmd = (config or {}).root_dir and config.root_dir .. '/node_modules/.bin/biome'
		if local_cmd and vim.fn.executable(local_cmd) == 1 then
			cmd = local_cmd
		end
		return vim.lsp.rpc.start({ cmd, 'lsp-proxy' }, dispatchers)
	end,
	filetypes = {
		'css',
		'graphql',
		'html',
		'javascript',
		'javascript.jsx',
		'javascriptreact',
		'json',
		'jsonc',
		'svelte',
		'typescript',
		'typescript.tsx',
		'typescriptreact',
		'vue',
	},
	on_attach = function(client, bufnr)
		if client.name == 'biome' then
			vim.api.nvim_create_autocmd('BufWritePre', {
				group = vim.api.nvim_create_augroup('BiomeFormatting', { clear = true }),
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.code_action({
						context = {
							only = { 'source.fixAll.biome' },
							diagnostics = {},
						},
						apply = true,
					})
				end,
			})
		end
	end,
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		local root_files = { 'biome.json', 'biome.jsonc' }
		local package_json = vim.fs.find('package.json', {
			path = fname,
			upward = true,
		})[1]
		if package_json then
			local ok, content = pcall(vim.fn.readfile, package_json)
			if ok and vim.fn.join(content, '\n'):find('"biome"') then
				table.insert(root_files, 'package.json')
			end
		end

		local root_dir = vim.fs.dirname(vim.fs.find(root_files, { path = fname, upward = true })[1])
		on_dir(root_dir)
	end,
	workspace_required = true,
}
