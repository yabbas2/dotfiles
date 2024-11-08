return {
    "nvim-neo-tree/neo-tree.nvim",
    event = "VeryLazy",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function ()
        require("neo-tree").setup({
            default_component_configs = {
                symlink_target = {
                    enabled = true,
                },
                git_status = {
                    symbols = {
                        unstaged  = "",
                        staged    = "",
                    },
                    align = "right",
                },
                modified = {
                    symbol = "~",
                },
                diagnostics = {
                    symbols = {
                        error = "󰅙 ",
                        warn = "󰀦 ",
                        info = "󰋼 ",
                        hint = "󰋗 ",
                    },
                },
            },
            window = {
                mappings = {
                    ["<TAB>"] = { "toggle_node" },
                },
            },
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_hidden = false,
                },
                follow_current_file = {
                    enabled = true,
                },
            },
        })
    end,
    keys = {
        { "<leader>bb", "<CMD>Neotree<CR>", mode = { "n" } }
    }
}
