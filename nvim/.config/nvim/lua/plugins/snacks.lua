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
                icons = {
                    error = "󰅙 ",
                    warn = "󰀦 ",
                    info = "󰋼 ",
                    hint = "󰋗 ",
                    debug = " ",
                    trace = " ",
                },
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
            dashboard = { enabled = false },
            scroll = {
                animate = {
                    duration = { step = 15, total = 250 },
                    easing = "inSine",
                },
                animate_repeat = {
                    delay = 50,
                    duration = { step = 5, total = 50 },
                    easing = "inSine",
                },
            },
            indent = {
                indent = {
                    priority = 1,
                    enabled = true,
                    char = "│",
                    only_scope = false,
                    only_current = false,
                    hl = "SnacksIndent",
                },
                animate = { enabled = false, },
                scope = {
                    enabled = true,
                    priority = 200,
                    char = "│",
                    underline = false,
                    only_current = false,
                    hl = "Normal",
                },
                chunk = { enabled = false, },
            },
            styles = {},
        })
    end,
    keys = {
        { "<leader>bd", "<CMD>lua require('snacks').bufdelete()<CR>", mode = { "n" } },
    }
}
