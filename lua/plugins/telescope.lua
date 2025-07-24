return {
	'nvim-telescope/telescope.nvim',
	cmd = 'Telescope',
	config = function(_, opts)
		local telescope = require('telescope')
		telescope.setup(opts)
		telescope.load_extension('fzf')
	end,
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
		},
	},
	keys = function()
		local builtin = require('telescope.builtin')
		return {
            -- stylua: ignore start
			{ '<leader>,', '<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>', desc = 'Switch Buffer' },
			{ '<leader>/', '<cmd>Telescope live_grep<cr>', desc = 'Grep (Root Dir)' },
			{ '<leader>:', '<cmd>Telescope command_history<cr>', desc = 'Command History' },
			{ '<C-f>', '<cmd>Telescope git_files<cr>', desc = 'Find Git Files (Root Dir)' },
			{ '<leader><space>', '<cmd>Telescope find_files<cr>', desc = 'Find Files (Root Dir)' },
			-- Find
			{ '<leader>fb', '<cmd>Telescope buffers sort_mru=true sort_lastused=true ignore_current_buffer=true<cr>', desc = 'Buffers', },
			{ '<leader>fc', function() builtin.find_files({ cwd = vim.fn.stdpath('config') }) end, desc = 'Find Config File', },
			{ '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files (Root Dir)' },
			{ '<leader>fF', function() builtin.find_files({ cwd = vim.uv.cwd() }) end, desc = 'Find Files (cwd)', },
			{ '<leader>fg', '<cmd>Telescope git_files<cr>', desc = 'Find Files (git-files)' },
			{ '<leader>fr', '<cmd>Telescope oldfiles<cr>', desc = 'Recent' },
			{ '<leader>fR', function() builtin.oldfiles({ cwd = vim.uv.cwd() }) end, desc = 'Recent (cwd)', },
            -- Git
            { '<leader>gc', '<cmd>Telescope git_commits<CR>', desc = 'Commits' },
            { '<leader>gs', '<cmd>Telescope git_status<CR>', desc = 'Status' },
            -- Search
            { '<leader>s"', '<cmd>Telescope registers<cr>', desc = 'Registers' },
            { '<leader>sa', '<cmd>Telescope autocommands<cr>', desc = 'Auto Commands' },
            { '<leader>sb', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Buffer' },
            { '<leader>sc', '<cmd>Telescope command_history<cr>', desc = 'Command History' },
            { '<leader>sC', '<cmd>Telescope commands<cr>', desc = 'Commands' },
            { '<leader>sd', '<cmd>Telescope diagnostics bufnr=0<cr>', desc = 'Document Diagnostics' },
            { '<leader>sD', '<cmd>Telescope diagnostics<cr>', desc = 'Workspace Diagnostics' },
            { '<leader>sg', function() builtin.live_grep() end, desc = 'Grep (Root Dir)' },
            { '<leader>sG', function() builtin.live_grep({ cwd = vim.uv.cwd() }) end, desc = 'Grep (cwd)' },
            { '<leader>sh', '<cmd>Telescope help_tags<cr>', desc = 'Help Pages' },
            { '<leader>sH', '<cmd>Telescope highlights<cr>', desc = 'Search Highlight Groups' },
            { '<leader>sj', '<cmd>Telescope jumplist<cr>', desc = 'Jumplist' },
            { '<leader>sk', '<cmd>Telescope keymaps<cr>', desc = 'Key Maps' },
            { '<leader>sl', '<cmd>Telescope loclist<cr>', desc = 'Location List' },
            { '<leader>sM', '<cmd>Telescope man_pages<cr>', desc = 'Man Pages' },
            { '<leader>sm', '<cmd>Telescope marks<cr>', desc = 'Jump to Mark' },
            { '<leader>so', '<cmd>Telescope vim_options<cr>', desc = 'Options' },
            { '<leader>sR', '<cmd>Telescope resume<cr>', desc = 'Resume' },
            { '<leader>sq', '<cmd>Telescope quickfix<cr>', desc = 'Quickfix List' },
            { '<leader>sw', function() builtin.grep_string({ word_match = '-w' }) end, desc = 'Word (Root Dir)' },
            { '<leader>sW', function() builtin.grep_string({ cwd = vim.uv.cwd(), word_match = '-w' }) end, desc = 'Word (cwd)' },
            { '<leader>sw', function() builtin.grep_string() end, mode = 'v', desc = 'Selection (Root Dir)' },
            { '<leader>sW', function() builtin.grep_string({ cwd = vim.uv.cwd() }) end, mode = 'v', desc = 'Selection (cwd)' },
            { '<leader>ss', function() builtin.lsp_document_symbols() end, desc = 'Goto Symbol', },
            { '<leader>sS', function() builtin.lsp_dynamic_workspace_symbols() end, desc = 'goto symbol (workspace)', },
            -- UI
            { '<leader>UC', function() builtin.colorscheme({ enable_preview = true }) end, desc = 'Colorscheme with Preview' },
			-- stylua: ignore end
		}
	end,
	opts = function()
		local actions = require('telescope.actions')
		local builtin = require('telescope.builtin')
		local open_with_trouble = function(...)
			return require('trouble.sources.telescope').open(...)
		end
		local find_files_no_ignore = function()
			local action_state = require('telescope.actions.state')
			local line = action_state.get_current_line()
			builtin.find_files({ no_ignore = true, default_text = line })
		end
		local find_files_with_hidden = function()
			local action_state = require('telescope.actions.state')
			local line = action_state.get_current_line()
			builtin.find_files({ hidden = true, default_text = line })
		end

		return {
			defaults = {
				default_text = '', -- bug that causes 'a' to prepopulate searches
				-- open files in the first window that is an actual file or is an oil filetype.
				-- use the current window if no other window is available.
				get_selection_window = function()
					local wins = vim.api.nvim_list_wins()
					table.insert(wins, 1, vim.api.nvim_get_current_win())
					for _, win in ipairs(wins) do
						local buf = vim.api.nvim_win_get_buf(win)
						if vim.bo[buf].buftype == '' or vim.bo[buf].filetype == 'oil' then
							return win
						end
					end
					return 0
				end,
				mappings = {
					i = {
						['<c-t>'] = open_with_trouble,
						['<a-t>'] = open_with_trouble,
						['<a-i>'] = find_files_no_ignore,
						['<a-h>'] = find_files_with_hidden,
						['<c-down>'] = actions.cycle_history_next,
						['<c-up>'] = actions.cycle_history_prev,
						['<c-f>'] = actions.preview_scrolling_down,
						['<c-b>'] = actions.preview_scrolling_up,
					},
					n = {
						['q'] = actions.close,
					},
				},
			},
		}
	end,
	tag = '0.1.8',
}
