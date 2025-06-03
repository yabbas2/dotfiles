return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    config = function()
        require('snacks').setup({
            bigfile = { enabled = false },
            notifier = {
                enabled = true,
                style = "compact",
                top_down = false,
                icons = {
                    debug = " ",
                    trace = " ",
                },
            },
            lazygit = { enabled = true },
            quickfile = { enabled = false },
            statuscolumn = {
                enabled = true,
                folds = {
                    open = true,
                    git_hl = true,
                },
                git = {
                    patterns = { "MiniDiffSign" },
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
            explorer = { enabled = false, },
            picker = {
                sources = {
                    buffers = {
                        preview = "none",
                        layout = { preset = "vscode", },
                        focus = "list",
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
                previewers = {
                    file = {
                        max_size = 2024 * 2024,
                        max_line_length = 1000,
                    },
                },
            },
            image = {
                enabled = true,
                force = true,
            },
            styles = {},
        })
    end,
    keys = {
        -- buffer delete
        { "<leader>q",  "<CMD>lua require('snacks').bufdelete()<CR>",         mode = { "n" } },
        -- find
        { "<leader>fb", function() Snacks.picker.buffers() end,               desc = "Buffers" },
        { "<leader>ff", function() Snacks.picker.files() end,                 desc = "Find Files" },
        { "<leader>fr", function() Snacks.picker.recent() end,                desc = "Recent" },
        -- grep
        { "<leader>fB", function() Snacks.picker.grep_buffers() end,          desc = "Grep Open Buffers" },
        { "<leader>fg", function() Snacks.picker.grep() end,                  desc = "Grep" },
        { "<leader>fw", function() Snacks.picker.grep_word() end,             desc = "Visual selection or word", mode = { "n", "x" } },
        -- search
        { "<leader>fc", function() Snacks.picker.command_history() end,       desc = "Command History" },
        { "<leader>fd", function() Snacks.picker.diagnostics() end,           desc = "Diagnostics" },
        { "<leader>fh", function() Snacks.picker.search_history() end,        desc = "Search History" },
        { "<leader>fu", function() Snacks.picker.resume() end,                desc = "Resume" },
        { "<leader>fp", function() Snacks.picker.projects() end,              desc = "Projects" },
        { "<leader>fj", function() Snacks.picker.jumps() end,                 desc = "Jumps" },
        { "<leader>fn", function() Snacks.picker.notifications() end,         desc = "Notification" },
        -- LSP
        { "<leader>fs", function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols" },
        { "<leader>fS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
        -- undo
        { "<leader>u",  function() Snacks.picker.undo() end,                  desc = "Undo" },
        -- lazygit
        { "<leader>gg", function() Snacks.lazygit() end,                      desc = "Lazygit" },
        -- LSP
        { "grr",        function() Snacks.picker.lsp_references() end,        desc = "LSP references" },
        { "gd",         function() Snacks.picker.lsp_definitions() end,       desc = "LSP definitions" },
        { "gri",        function() Snacks.picker.lsp_implementations() end,   desc = "LSP implementations" },
    }
}
