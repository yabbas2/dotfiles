return {
    {
        'echasnovski/mini.diff',
        version = false,
        config = function()
            require('mini.diff').setup({
                view = {
                    style = "sign",
                    signs = { add = '┃', change = '┃', delete = '-' },
                }
            })
        end
    },
    {
        'echasnovski/mini.surround',
        version = false,
        config = function()
            require('mini.surround').setup()
        end
    },
    {
        'echasnovski/mini.pairs',
        version = false,
        config = function()
            require('mini.pairs').setup({
                modes = { insert = true, command = true, terminal = true },
            })
        end
    },
    {
        'echasnovski/mini.snippets',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = false,
        config = function()
            local gen_loader = require('mini.snippets').gen_loader
            require('mini.snippets').setup({
                snippets = {
                    gen_loader.from_file(vim.fn.stdpath("data") .. "/lazy/friendly-snippets/package_json"),
                    gen_loader.from_lang(),
                },
                mappings = {
                    expand = '<C-j>',
                    jump_next = '<C-l>',
                    jump_prev = '<C-h>',
                    stop = '<C-e>',
                },
            })
            require('mini.snippets').start_lsp_server()
        end
    },
    {
        'echasnovski/mini.icons',
        dependencies = { "onsails/lspkind-nvim" },
        version = false,
        config = function()
            require('mini.icons').setup()
            require('mini.icons').tweak_lsp_kind("replace")
            require('lspkind').setup()
        end
    },
    {
        'echasnovski/mini.splitjoin',
        version = false,
        config = function()
            require('mini.splitjoin').setup({
                mappings = {
                    toggle = '',
                    split = 'gs',
                    join = 'gj',
                },
            })
        end
    },
    {
        'echasnovski/mini.sessions',
        version = false,
        init = function()
            vim.opt.sessionoptions = "buffers,curdir,folds,tabpages,winsize,winpos,terminal,localoptions"
        end,
        config = function()
            require('mini.sessions').setup({
                directory = vim.fn.stdpath('data') .. '/mini-sessions',
                file = '',
            })
        end
    },
    {
        'echasnovski/mini.cursorword',
        version = false,
        config = function()
            require('mini.cursorword').setup()
        end
    },
    {
        'echasnovski/mini.hipatterns',
        version = false,
        config = function()
            local hipatterns = require('mini.hipatterns')
            hipatterns.setup({
                highlighters = {
                    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                    fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
                    hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
                    todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
                    note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
                    -- Highlight hex color strings (`#rrggbb`) using that color
                    hex_color = hipatterns.gen_highlighter.hex_color(),
                }
            })
        end
    },
    {
        'echasnovski/mini.trailspace',
        version = false,
        config = function()
            local MiniTrailspace = require('mini.trailspace')
            MiniTrailspace.setup()
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = vim.api.nvim_create_augroup("Strip Whitespace", { clear = true }),
                callback = function()
                    MiniTrailspace.trim()
                end,
            })
        end
    },
}
