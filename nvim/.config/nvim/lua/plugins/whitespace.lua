return {
    'ntpeters/vim-better-whitespace',
    lazy = false,
    config = function()
        vim.g.better_whitespace_operator=''
        vim.g.better_whitespace_filetypes_blacklist={'diff', 'git', 'gitcommit', 'unite', 'qf', 'help', 'fugitive'}
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Strip Whitespace", {clear = true}),
            callback = function()
                vim.cmd([[StripWhitespace]])
            end,
        })
    end,
}
