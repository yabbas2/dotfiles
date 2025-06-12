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
                        sort_lastused = true,
                    },
                    git_branches = {
                        layout = { preset = "select" },
                    }
                },
                layout = {
                    cycle = true,
                    preset = "vertical",
                },
                layouts = {
                    vertical = {
                        layout = {
                            width = 0.8,
                            border = "single",
                        },
                    },
                    select = {
                        layout = {
                            border = "single",
                        },
                    },
                    vscode = {
                        layout = {
                            border = "none",
                            row = 1,
                            width = 0.4,
                            height = 0.3,
                            box = "vertical",
                            { win = "input", height = 1,       border = "single", title = "{title} {live} {flags}", title_pos = "center" },
                            { win = "list",  border = "single" },
                        },
                    },
                    dropdown = {
                        layout = {
                            border = "single",
                        },
                    },
                },
                previewers = {
                    file = {
                        max_size = 2024 * 2024,
                        max_line_length = 1000,
                    },
                },
                debug = {
                    scores = false,
                },
                matcher = {
                    frecency = true,
                },
                win = {
                    input = {
                        keys = {
                            ["J"] = { "preview_scroll_down", mode = { "i", "n" } },
                            ["K"] = { "preview_scroll_up", mode = { "i", "n" } },
                            ["H"] = { "preview_scroll_left", mode = { "i", "n" } },
                            ["L"] = { "preview_scroll_right", mode = { "i", "n" } },
                        },
                    },
                },
            },
            image = {
                enabled = true,
                force = true,
            },
            dashboard = {
                preset = {
                    keys = {
                        { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                        { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})", },
                        { icon = " ", key = "s", desc = "Select Session", action = ":lua MiniSessions.select()" },
                        { icon = " ", key = "<esc>", desc = "Quit", action = ":qa" }
                    },
                    header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
                },
                sections = {
                    { section = "header" },
                    { section = "keys",   gap = 1, padding = 1 },
                    { section = "startup" },
                },
            },
            styles = {},
        })
    end,
    keys = {
        -- buffer delete
        { "<leader>q",       "<CMD>lua require('snacks').bufdelete()<CR>",         mode = { "n" } },
        -- find
        { "<leader><space>", function() Snacks.picker.buffers() end,               desc = "Buffers" },
        { "<leader>ff",      function() Snacks.picker.files() end,                 desc = "Find Files" },
        { "<leader>fr",      function() Snacks.picker.recent() end,                desc = "Recent" },
        -- grep
        { "<leader>fb",      function() Snacks.picker.grep_buffers() end,          desc = "Grep Open Buffers" },
        { "<leader>fg",      function() Snacks.picker.grep() end,                  desc = "Grep" },
        { "<leader>fw",      function() Snacks.picker.grep_word() end,             desc = "Visual selection or word", mode = { "n", "x" } },
        -- search
        { "<leader>fc",      function() Snacks.picker.command_history() end,       desc = "Command History" },
        { "<leader>fd",      function() Snacks.picker.diagnostics() end,           desc = "Diagnostics" },
        { "<leader>fh",      function() Snacks.picker.search_history() end,        desc = "Search History" },
        { "<leader>fu",      function() Snacks.picker.resume() end,                desc = "Resume" },
        { "<leader>fp",      function() Snacks.picker.projects() end,              desc = "Projects" },
        { "<leader>fj",      function() Snacks.picker.jumps() end,                 desc = "Jumps" },
        { "<leader>fn",      function() Snacks.picker.notifications() end,         desc = "Notification" },
        -- undo
        { "<leader>u",       function() Snacks.picker.undo() end,                  desc = "Undo" },
        -- lsp
        { "grr",             function() Snacks.picker.lsp_references() end,        desc = "LSP references" },
        { "gd",              function() Snacks.picker.lsp_definitions() end,       desc = "LSP definitions" },
        { "gri",             function() Snacks.picker.lsp_implementations() end,   desc = "LSP implementations" },
        { "<leader>fs",      function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols" },
        { "<leader>fS",      function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
        -- git
        { "<leader>gg",      function() Snacks.lazygit() end,                      desc = "Lazygit" },
        { "<leader>gb",      function() Snacks.picker.git_branches() end,          desc = "Git Branches" },
    }
}
