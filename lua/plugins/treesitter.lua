return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    config = function()
        local ts = require('nvim-treesitter')

        ts.install({
            'bash',
            'css',
            'csv',
            'diff',
            'dockerfile',
            'git_config',
            'git_rebase',
            'gitattributes',
            'gitcommit',
            'gitignore',
            'go',
            'gomod',
            'gosum',
            'gotmpl',
            'gowork',
            'graphql',
            'html',
            'http',
            'javascript',
            'jsdoc',
            'json',
            'jsonc',
            'json5',
            'lua',
            'luadoc',
            'luap',
            'make',
            'markdown',
            'markdown_inline',
            'nginx',
            'ninja',
            'pem',
            'python',
            'query',
            'regex',
            'rst',
            'rust',
            'scss',
            'ssh_config',
            'sql',
            'toml',
            'tsx',
            'typescript',
            'vim',
            'vimdoc',
            'xml',
            'yaml',
            'zig',
        })

        -- Enable highlighting and indentation on FileType
        vim.api.nvim_create_autocmd('FileType', {
            group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true }),
            desc = 'Enable treesitter highlighting and indentation',
            callback = function(event)
                local buf = event.buf
                pcall(vim.treesitter.start, buf)
                vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
    lazy = false,
}
