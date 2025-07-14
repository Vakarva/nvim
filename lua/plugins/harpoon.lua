return {
	'ThePrimeagen/harpoon',
	branch = 'harpoon2',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = function()
		local harpoon = require('harpoon')
		return {
			{
				'<leader>ha',
				function()
					harpoon:list():add()
				end,
				desc = 'Harpoon add file',
			},
			{
				'<C-e>',
				function()
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = 'Harpoon quick menu',
			},
			{
				'<leader>1',
				function()
					harpoon:list():select(1)
				end,
				desc = 'Harpoon to file 1',
			},
			{
				'<leader>2',
				function()
					harpoon:list():select(2)
				end,
				desc = 'Harpoon to file 2',
			},
			{
				'<leader>3',
				function()
					harpoon:list():select(3)
				end,
				desc = 'Harpoon to file 3',
			},
			{
				'<leader>4',
				function()
					harpoon:list():select(4)
				end,
				desc = 'Harpoon to file 4',
			},
			{
				'[h',
				function()
					harpoon:list():prev()
				end,
				desc = 'Harpoon prev',
			},
			{
				']h',
				function()
					harpoon:list():next()
				end,
				desc = 'Harpoon next',
			},
		}
	end,
	opts = {},
}
