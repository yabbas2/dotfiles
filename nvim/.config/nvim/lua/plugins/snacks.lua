return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    init = function ()
        vim.fn.sign_define("DiagnosticSignHint", { text = "󰋗 ", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define("DiagnosticSignInfo", { text = "󰋼 ", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define("DiagnosticSignError", { text = "󰅙 ", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define("DiagnosticSignWarn", { text = "󰀦 ", texthl = "", linehl = "", numhl = "" })
    end,
    config = function ()
        require('snacks').setup({
            bigfile = { enabled = false },
            notifier = {
                enabled = true,
                style = "compact",
                top_down = false,
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
        { "<leader>bd", "<CMD>lua require('snacks').bufdelete()<CR>", mode = { "n" } },
    }
}
