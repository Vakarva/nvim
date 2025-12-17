local M = {}

function M.setup()
	-- Spell checking
	vim.opt_local.spell = true
	vim.opt_local.spelllang = 'en_us'

	-- Word wrapping
	vim.opt_local.wrap = true
	vim.opt_local.linebreak = true
	vim.opt_local.breakindent = true
end

return M
