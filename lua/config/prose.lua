local M = {}

function M.setup()
	-- Spell checking
	if vim.api.nvim_win_get_config(0).relative == '' then
		vim.opt_local.spell = true
		vim.opt_local.spelllang = 'en_us'
	end
	--
	-- Word wrapping
	vim.opt_local.wrap = true
	vim.opt_local.linebreak = true
	vim.opt_local.breakindent = true
end

return M
