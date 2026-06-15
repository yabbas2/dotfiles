vim.pack.add({ 'https://github.com/echasnovski/mini.surround' })
require('mini.surround').setup()

vim.pack.add({ 'https://github.com/echasnovski/mini.pairs' })
require('mini.pairs').setup({
    modes = { insert = true, command = false, terminal = false },
})

vim.pack.add({ 'https://github.com/rafamadriz/friendly-snippets' })
vim.pack.add({ 'https://github.com/echasnovski/mini.snippets' })
local gen_loader = require('mini.snippets').gen_loader
require('mini.snippets').setup({
    snippets = {
        gen_loader.from_file(vim.fn.stdpath("data") .. "/site/pack/core/opt/friendly-snippets/package_json"),
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

vim.pack.add({ 'https://github.com/onsails/lspkind-nvim' })
vim.pack.add({ 'https://github.com/echasnovski/mini.icons' })
require('mini.icons').setup()
MiniIcons.tweak_lsp_kind("replace")
MiniIcons.mock_nvim_web_devicons()
require('lspkind').setup()

vim.pack.add({ 'https://github.com/echasnovski/mini.splitjoin' })
require('mini.splitjoin').setup({
    mappings = {
        toggle = '',
        split = 'gs',
        join = 'gj',
    },
})

vim.pack.add({ 'https://github.com/echasnovski/mini.sessions' })
vim.opt.sessionoptions = "buffers,curdir,folds,tabpages,winsize,winpos,terminal,localoptions"
require('mini.sessions').setup({
    directory = vim.fn.stdpath('data') .. '/mini-sessions',
    file = '',
})


vim.pack.add({ 'https://github.com/echasnovski/mini.hipatterns' })
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

vim.pack.add({ 'https://github.com/echasnovski/mini.trailspace' })
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

vim.pack.add({ 'https://github.com/echasnovski/mini.move' })
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

vim.pack.add({ 'https://github.com/echasnovski/mini.files' })
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
vim.keymap.set("n", "<leader>bb", function() require('mini.files').open() end, { noremap = true, silent = true })

vim.pack.add({ 'https://github.com/echasnovski/mini.ai' })
require('mini.ai').setup()

vim.pack.add({ 'https://github.com/nvim-mini/mini.starter' })
require('mini.starter').setup()
