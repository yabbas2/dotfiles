vim.pack.add({ 'https://github.com/folke/snacks.nvim' })

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
            patterns = { "GitSign" },
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
                max_size = 4096 * 4096,
                max_line_length = 100000,
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
    terminal = {
        start_insert = false,
        auto_insert = false,
    },
    styles = {},
})

vim.keymap.set("n", "<Leader>ff", function() Snacks.picker.files() end)
vim.keymap.set("n", "<Leader>fr", function() Snacks.picker.recent() end)
vim.keymap.set("n", "<Leader>fb", function() Snacks.picker.grep_buffers() end)
vim.keymap.set("n", "<Leader>fg", function() Snacks.picker.grep() end)
vim.keymap.set({ "n", "x" }, "<Leader>fw", function() Snacks.picker.grep_word() end)
vim.keymap.set("n", "<Leader>fc", function() Snacks.picker.command_history() end)
vim.keymap.set("n", "<Leader>fh", function() Snacks.picker.search_history() end)
vim.keymap.set("n", "<Leader>fd", function() Snacks.picker.diagnostics() end)
vim.keymap.set("n", "<Leader>fn", function() Snacks.picker.notifications() end)
vim.keymap.set("n", "<Leader>fS", function() Snacks.picker.lsp_workspace_symbols() end)
vim.keymap.set("n", "<Leader>fs", function() Snacks.picker.lsp_symbols() end)
vim.keymap.set("n", "<Leader>fk", function() Snacks.picker.keymaps() end)
vim.keymap.set("n", "grr", function() Snacks.picker.lsp_references() end)
vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end)
vim.keymap.set("n", "gri", function() Snacks.picker.lsp_implementations() end)
vim.keymap.set("n", "<leader><space>", function() Snacks.picker.buffers() end)
vim.keymap.set("n", "<leader>fu", function() Snacks.picker.resume() end)
vim.keymap.set("n", "<leader>fj", function() Snacks.picker.jumps() end)
vim.keymap.set("n", "<leader>u", function() Snacks.picker.undo() end)
vim.keymap.set("n", "<leader>gg", function() Snacks.lazygit() end)
vim.keymap.set("n", "<leader>q", function() Snacks.bufdelete() end)

vim.keymap.set("n", "<leader>tt", function()
        local win = vim.api.nvim_get_current_win()
        local width = vim.api.nvim_win_get_width(win)
        local height = vim.api.nvim_win_get_height(win)
        local position = width > (height * 2) and "right" or "bottom"
        local nof_terms = #Snacks.terminal.list()

        Snacks.terminal.open(nil, {
            count = nof_terms + 1,
            win = {
                style = "terminal",
                position = position,
                relative = "win",
            },
        })
    end,
    { noremap = true, silent = true })

vim.keymap.set("n", "<leader>ft", function()
        local terms = Snacks.terminal.list()
        if #terms == 0 then
            vim.notify("No open terminals", vim.log.levels.INFO)
            return
        end

        Snacks.picker.pick({
            title = "Open Terminals",
            layout = "vscode",
            items = vim.tbl_map(function(t)
                return {
                    text = t.buf_name or ("Terminal " .. t.id),
                    term = t,
                }
            end, terms),
            format = function(item)
                return { { item.text, "SnacksPickerFile" } }
            end,
            confirm = function(picker, item)
                picker:close()
                if item.term.opts.show then
                    item.term:focus()
                else
                    item.term:toggle()
                end
            end,
        })
    end,
    { noremap = true, silent = true })
