return {
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
        lazy = false,
        config = function()
            require('mini.icons').setup()
            MiniIcons.tweak_lsp_kind("replace")
            MiniIcons.mock_nvim_web_devicons()
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
        'echasnovski/mini.hipatterns',
        version = false,
        config = function()
            local hipatterns = require('mini.hipatterns')
            hipatterns.setup({
                highlighters = {
                    fix       = { pattern = '%f[%w]()FIX()%f[%W]', group = 'MiniHipatternsFixme' },
                    fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
                    hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
                    warn      = { pattern = '%f[%w]()WARNING()%f[%W]', group = 'MiniHipatternsHack' },
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
            local grp = vim.api.nvim_create_augroup("MiniTrailspace", { clear = true })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = grp,
                callback = function()
                    MiniTrailspace.trim()
                end,
            })
            vim.api.nvim_create_autocmd("VimEnter", {
                group = grp,
                callback = function()
                    MiniTrailspace.unhighlight()
                end,
            })
        end
    },
    {
        'echasnovski/mini.move',
        version = false,
        config = function()
            require('mini.move').setup({
                mappings = {
                    -- visual mode
                    left = '<M-h>',
                    right = '<M-l>',
                    down = '<M-j>',
                    up = '<M-k>',
                    -- normal mode
                    line_left = '<M-h>',
                    line_right = '<M-l>',
                    line_down = '<M-j>',
                    line_up = '<M-k>',
                },
            })
        end
    },
    {
        'echasnovski/mini.files',
        version = false,
        config = function()
            require('mini.files').setup({
                options = {
                    permanent_delete = false,
                },
                mappings = {
                    close       = 'q',
                    go_in       = '<CR>',
                    go_in_plus  = '',
                    go_out      = '<BS>',
                    go_out_plus = '',
                    mark_goto   = "'",
                    mark_set    = 'm',
                    reset       = '<ESC>',
                    reveal_cwd  = '@',
                    show_help   = 'g?',
                    synchronize = '=',
                    trim_left   = '<',
                    trim_right  = '>',
                },
            })
        end,
        keys = {
            { "<leader>bb", "<CMD>lua require('mini.files').open()<CR>", mode = "n" }
        }
    },
}
