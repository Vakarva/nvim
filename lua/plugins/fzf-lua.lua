return {
    'ibhagwan/fzf-lua',
    cmd = 'FzfLua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = function()
        local fzf = require('fzf-lua')
        local root = vim.fs.root(0, { '.git', 'Makefile', 'pyproject.toml', 'package.json' }) or vim.fn.getcwd()
        return {
            -- stylua: ignore start
			{ '<c-j>', '<c-j>', ft = 'fzf', mode = 't', nowait = true },
			{ '<c-k>', '<c-k>', ft = 'fzf', mode = 't', nowait = true },
			{ '<leader>,', '<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>', desc = 'Switch Buffer' },
			{ '<leader>/', '<cmd>FzfLua live_grep<cr>', desc = 'Grep (Root Dir)' },
			{ '<leader>:', '<cmd>FzfLua command_history<cr>', desc = 'Command History' },
			{ '<C-f>', '<cmd>FzfLua git_files<cr>', desc = 'Find Files (git-files)' },
			{ '<leader><space>', function() fzf.files({ cwd = root }) end, desc = 'Find Files (Root Dir)', },
			-- find
			{ '<leader>fb', '<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>', desc = 'Buffers' },
			{ '<leader>fc', function() fzf.files({ cwd = vim.fn.stdpath('config') }) end, desc = 'Find Config File', },
			{ '<leader>ff', function() fzf.files({ cwd = root }) end, desc = 'Find Files (Root Dir)', },
			{ '<leader>fF', '<cmd>FzfLua files<cr>', desc = 'Find Files (cwd)' },
			{ '<leader>fg', '<cmd>FzfLua git_files<cr>', desc = 'Find Files (git-files)' },
			{ '<leader>fr', '<cmd>FzfLua oldfiles<cr>', desc = 'Recent' },
			{ '<leader>fR', function() fzf.oldfiles({ cwd_only = true }) end, desc = 'Recent (cwd)', },
			-- git
			{ '<leader>gc', '<cmd>FzfLua git_commits<CR>', desc = 'Commits' },
			{ '<leader>gs', '<cmd>FzfLua git_status<CR>', desc = 'Status' },
			-- search
			{ '<leader>s"', '<cmd>FzfLua registers<cr>', desc = 'Registers' },
			{ '<leader>sa', '<cmd>FzfLua autocmds<cr>', desc = 'Auto Commands' },
			{ '<leader>sb', '<cmd>FzfLua grep_curbuf<cr>', desc = 'Buffer' },
			{ '<leader>sc', '<cmd>FzfLua command_history<cr>', desc = 'Command History' },
			{ '<leader>sC', '<cmd>FzfLua commands<cr>', desc = 'Commands' },
			{ '<leader>sd', '<cmd>FzfLua diagnostics_document<cr>', desc = 'Document Diagnostics' },
			{ '<leader>sD', '<cmd>FzfLua diagnostics_workspace<cr>', desc = 'Workspace Diagnostics' },
			{ '<leader>sg', function() fzf.live_grep({ cwd = root }) end, desc = 'Grep (Root Dir)', },
			{ '<leader>sG', '<cmd>FzfLua live_grep<cr>', desc = 'Grep (cwd)' },
			{ '<leader>sh', '<cmd>FzfLua help_tags<cr>', desc = 'Help Pages' },
			{ '<leader>sH', '<cmd>FzfLua highlights<cr>', desc = 'Search Highlight Groups' },
			{ '<leader>sj', '<cmd>FzfLua jumps<cr>', desc = 'Jumplist' },
			{ '<leader>sk', '<cmd>FzfLua keymaps<cr>', desc = 'Key Maps' },
			{ '<leader>sl', '<cmd>FzfLua loclist<cr>', desc = 'Location List' },
			{ '<leader>sM', '<cmd>FzfLua man_pages<cr>', desc = 'Man Pages' },
			{ '<leader>sm', '<cmd>FzfLua marks<cr>', desc = 'Jump to Mark' },
			{ '<leader>sR', '<cmd>FzfLua resume<cr>', desc = 'Resume' },
			{ '<leader>sq', '<cmd>FzfLua quickfix<cr>', desc = 'Quickfix List' },
			{ '<leader>sw', function() fzf.grep_cword({ cwd = root }) end, desc = 'Word (Root Dir)', },
			{ '<leader>sW', '<cmd>FzfLua grep_cword<cr>', desc = 'Word (cwd)' },
			{ '<leader>sw', function() fzf.grep_visual({ cwd = root }) end, mode = 'v', desc = 'Selection (Root Dir)', },
			{ '<leader>sW', '<cmd>FzfLua grep_visual<cr>', mode = 'v', desc = 'Selection (cwd)' },
			{ '<leader>ss', '<cmd>FzfLua lsp_document_symbols<cr>', desc = 'Goto Symbol' },
			{ '<leader>sS', '<cmd>FzfLua lsp_live_workspace_symbols<cr>', desc = 'Goto Symbol (Workspace)' },
			-- UI
			{ '<leader>UC', '<cmd>FzfLua colorschemes<cr>', desc = 'Colorscheme with Preview' },
            -- stylua: ignore end
        }
    end,
    opts = function()
        local fzf = require('fzf-lua')
        local config = fzf.config
        local actions = fzf.actions

        config.defaults.keymap.fzf['ctrl-q'] = 'select-all+accept'
        config.defaults.keymap.fzf['ctrl-u'] = 'half-page-up'
        config.defaults.keymap.fzf['ctrl-d'] = 'half-page-down'
        config.defaults.keymap.fzf['ctrl-x'] = 'jump'
        config.defaults.keymap.fzf['ctrl-f'] = 'preview-page-down'
        config.defaults.keymap.fzf['ctrl-b'] = 'preview-page-up'
        config.defaults.keymap.builtin['<c-f>'] = 'preview-page-down'
        config.defaults.keymap.builtin['<c-b>'] = 'preview-page-up'
        config.defaults.actions.files['ctrl-t'] = actions.file_tabedit

        local img_previewer ---@type string[]?
        for _, v in ipairs({
            { cmd = 'ueberzug', args = {} },
            { cmd = 'chafa', args = { '{file}', '--format=symbols' } },
            { cmd = 'viu', args = { '-b' } },
        }) do
            if vim.fn.executable(v.cmd) == 1 then
                img_previewer = vim.list_extend({ v.cmd }, v.args)
                break
            end
        end

        return {
            fzf_colors = true,
            fzf_opts = {
                ['--no-scrollbar'] = true,
            },
            defaults = {
                -- formatter = "path.filename_first",
                formatter = 'path.dirname_first',
            },
            previewers = {
                builtin = {
                    extensions = {
                        ['png'] = img_previewer,
                        ['jpg'] = img_previewer,
                        ['jpeg'] = img_previewer,
                        ['gif'] = img_previewer,
                        ['webp'] = img_previewer,
                    },
                    ueberzug_scaler = 'fit_contain',
                },
            },
            ui_select = function(fzf_opts, items)
                return vim.tbl_deep_extend('force', fzf_opts, {
                    prompt = ' ',
                    winopts = {
                        title = ' ' .. vim.trim((fzf_opts.prompt or 'Select'):gsub('%s*:%s*$', '')) .. ' ',
                        title_pos = 'center',
                    },
                }, fzf_opts.kind == 'codeaction' and {
                    winopts = {
                        layout = 'vertical',
                        -- height is number of items minus 15 lines for the preview, with a max of 80% screen height
                        height = math.floor(math.min(vim.o.lines * 0.8 - 16, #items + 2) + 0.5) + 16,
                        width = 0.5,
                        preview = {
                            layout = 'vertical',
                            vertical = 'down:15,border-top',
                        },
                    },
                } or {
                    winopts = {
                        width = 0.5,
                        -- height is number of items, with a max of 80% screen height
                        height = math.floor(math.min(vim.o.lines * 0.8, #items + 2) + 0.5),
                    },
                })
            end,
            winopts = {
                width = 0.8,
                height = 0.8,
                row = 0.5,
                col = 0.5,
                preview = {
                    scrollchars = { '┃', '' },
                },
            },
            files = {
                cwd_prompt = false,
                actions = {
                    ['alt-i'] = { actions.toggle_ignore },
                    ['alt-h'] = { actions.toggle_hidden },
                },
            },
            grep = {
                actions = {
                    ['alt-i'] = { actions.toggle_ignore },
                    ['alt-h'] = { actions.toggle_hidden },
                },
            },
            lsp = {
                symbols = {
                    symbol_hl = function(s)
                        return 'TroubleIcon' .. s
                    end,
                    symbol_fmt = function(s)
                        return s:lower() .. '\t'
                    end,
                    child_prefix = false,
                },
                code_actions = {
                    previewer = vim.fn.executable('delta') == 1 and 'codeaction_native' or nil,
                },
            },
        }
    end,
}
