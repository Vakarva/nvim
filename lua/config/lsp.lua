local lsp_configs = {}

for _, f in pairs(vim.api.nvim_get_runtime_file('lsp/*.lua', true)) do
	local server_name = vim.fn.fnamemodify(f, ':t:r')
	table.insert(lsp_configs, server_name)
end

vim.lsp.enable(lsp_configs)

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(e)
		local telescope = require('telescope.builtin')
		local keymapOpts = { buffer = e.buf }
		vim.keymap.set('n', 'gd', function()
			telescope.lsp_definitions({ reuse_win = true })
		end, keymapOpts, { desc = 'Goto Definition (Telescope)' })
		vim.keymap.set(
			'n',
			'gr',
			'<cmd>Telescope lsp_references<cr>',
			keymapOpts,
			{ desc = 'Find References (Telescope)', nowait = true }
		)
		vim.keymap.set('n', 'gI', function()
			telescope.lsp_implementations({ reuse_win = true })
		end, keymapOpts, { desc = 'Goto [I]mplementation (Telescope)' })
		vim.keymap.set('n', 'gy', function()
			telescope.lsp_type_definitions({ reuse_win = true })
		end, keymapOpts, { desc = 'Goto T[y]pe Definition (Telescope)' })
	end,
})

vim.diagnostic.config({
	float = {
		focusable = false,
		style = 'minimal',
		border = 'rounded',
		source = 'if_many',
		header = '',
		prefix = '',
	},
	virtual_lines = {
		current_line = true,
	},
})
