return {
    {
        "lewis6991/gitsigns.nvim",
        config = function ()
            require('gitsigns').setup {
                sign_priority = 1,
                signs_staged_enable = false,
            }
        end
    },
    {
        "sindrets/diffview.nvim",
        event = "VeryLazy",
        config = function ()
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
            })
        end
    },
    {
        "NeogitOrg/neogit",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function ()
            require("neogit").setup({
                graph_style = "unicode",
            })
        end,
        keys = {
            { "<leader>gg", "<CMD>Neogit<CR>", mode = { "n" } },
        },
    }
}
