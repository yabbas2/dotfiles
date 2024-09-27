return {
    {
        'ntpeters/vim-better-whitespace',
        config = function()
            vim.cmd "let g:better_whitespace_operator=''"
            vim.keymap.set('n', '<leader>sb',  "<cmd>StripWhitespace<CR>", { desc = 'Strip Whitespaces' })
            vim.keymap.set('n', '<leader>sB',  "<cmd>StripWhitespaceOnChangedLines<CR>", { desc = 'Strip Whitespaces (changes)' })
        end,
    },
}
