return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    config = function ()
        require('snacks').setup({
            bigfile = { enabled = false },
            notifier = {
                enabled = true,
                style = "minimal",
            },
            quickfile = { enabled = false },
            statuscolumn = {
                enabled = true,
                folds = {
                    open = true,
                    git_hl = true,
                },
                git = {
                    patterns = { "GitSign" },
                },
            },
            words = { enabled = false },
            styles = {},
        })
    end,
    keys = {
        { "<leader>tg", "<CMD>lua require('snacks').lazygit()<CR>", mode = { "n" } },
    }
}
