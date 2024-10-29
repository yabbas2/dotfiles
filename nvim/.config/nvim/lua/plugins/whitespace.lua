return {
    'ntpeters/vim-better-whitespace',
    lazy = false,
    config = function()
        vim.g.better_whitespace_operator=''
        vim.g.better_whitespace_filetypes_blacklist={'diff', 'git', 'gitcommit', 'unite', 'qf', 'help', 'fugitive'}
    end,
    keys = {
        { '<leader>sb', "<CMD>StripWhitespace<CR>",  mode = { 'n' } },
        { '<leader>sB', "<CMD>StripWhitespaceOnChangedLines<CR>",  mode = { 'n' } },
    },
}
