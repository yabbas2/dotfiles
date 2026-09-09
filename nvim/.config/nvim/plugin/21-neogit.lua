vim.pack.add({
    "https://github.com/rbong/flog-symbols",
    "https://github.com/NeogitOrg/neogit",
})

require('neogit').setup({
    graph_style = "kitty",
    integrations = {
        telescope = false,
        diffview = true,
        snacks = true,
    },
    diff_viewer = "diffview",
})

vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Show Neogit UI" })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "NeogitLogView",
    callback = function()
        vim.schedule(function()
            -- Neogit's log view UI object (holds the line -> commit mapping)
            local function get_ui()
                local log_view = require("neogit.buffers.log_view")
                local instance = log_view and log_view.instance
                return instance and instance.buffer and instance.buffer.ui
            end

            -- Unified Keymap
            vim.keymap.set({ "n", "v" }, "<CR>", function()
                local ui = get_ui()
                if not ui then
                    return
                end

                local mode = vim.api.nvim_get_mode().mode

                if mode:match("[vV\22]") then
                    -- Must be queried while still in visual mode: neogit uses
                    -- getpos("v") / getpos(".") to determine the selection
                    local commits = ui:get_commits_in_selection() -- oldest first

                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "nx", true)

                    local older = commits[1]
                    local newer = commits[#commits]

                    if older and newer then
                        if older == newer then
                            vim.cmd("DiffviewOpen " .. newer .. "^!")
                        else
                            -- Include the oldest selected commit's own changes
                            vim.cmd("DiffviewOpen " .. older .. "^.." .. newer)
                        end
                    else
                        print("[Neogit-Diffview] No commits found in selection.")
                    end
                else
                    -- Normal Mode: Single Commit Diff (Commit vs Parent)
                    local commit = ui:get_commit_under_cursor()
                    if commit then
                        vim.cmd("DiffviewOpen " .. commit .. "^!")
                    end
                end
            end, { buffer = true, silent = true, desc = "Diff selected range in Diffview" })
        end)
    end,
})
