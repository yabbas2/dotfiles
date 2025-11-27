return {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    config = function()
        require("diffview").setup({
            signs = {
                fold_closed = "",
                fold_open = "",
            },
            view = {
                default = {
                    disable_diagnostics = true,
                    winbar_info = true,
                },
                merge_tool = {
                    layout = "diff4_mixed",
                },
                file_history = {
                    disable_diagnostics = true,
                    winbar_info = true,
                },
            },
            keymaps = {
                view = {
                    { "n", "q", "<CMD>tabclose<CR>" }
                },
                file_panel = {
                    { "n", "q", "<CMD>tabclose<CR>" }
                },
                file_history_panel = {
                    { "n", "q", "<CMD>tabclose<CR>" }
                },
            },
        })
    end
}
