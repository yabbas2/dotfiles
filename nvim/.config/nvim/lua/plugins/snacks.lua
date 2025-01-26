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
            picker = {
                sources = {
                    buffers = {
                        preview = "none",
                        layout = { preset = "vscode", },
                    },
                    files = {
                        -- hidden = true,
                        ignored = true,
                    },
                    grep = {
                        -- hidden = true,
                        ignored = true,
                    },
                },
                layout = {
                    cycle = true,
                    preset = "vertical",
                },
                icons = {
                    diagnostics = {
                        Error = " ",
                        Warn  = " ",
                        Hint  = "󰋗 ",
                        Info  = " ",
                    },
                },
            },
            styles = {},
        })
    end,
    keys = {
        -- buffer delete
        { "<leader>bd", "<CMD>lua require('snacks').bufdelete()<CR>", mode = { "n" } },
        -- find
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
        { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
        -- grep
        { "<leader>fB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
        { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<leader>fw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
        -- search
        { "<leader>fc", function() Snacks.picker.command_history() end, desc = "Command History" },
        { "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
        { "<leader>fh", function() Snacks.picker.help() end, desc = "Help Pages" },
        { "<leader>fu", function() Snacks.picker.resume() end, desc = "Resume" },
        { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
        { "<leader>fy", function() Snacks.picker.cliphist() end, desc = "Clipboard history" },
        { "<leader>fj", function() Snacks.picker.jumps() end, desc = "Jumps" },
        -- LSP
        { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
        { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
        { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
        { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto Type Definition" },
        { "<leader>fs", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
        -- todo comments
        { "<leader>ft", function() Snacks.picker.todo_comments() end, desc = "Todo" },
        -- undo
        { "<leader>u", function() Snacks.picker.undo() end, desc = "Undo" },
    }
}
